import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_biniyog/App/modules/screens/withdraw_history/controllers/transaction_history_controller.dart';

class WithdrawHistoryView extends StatelessWidget {
  const WithdrawHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransactionHistoryController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff38b579),
        title: Text('Withdraw History', style: TextStyle(color: Colors.white)),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {

          final trx = controller.transactions.where((trx) => trx.paymentType == '3').toList();

          return trx.length < 1 ? Center(
            child: Text('No Data'),
          ) :  ListView.separated(
            itemCount: trx.length,
            padding: EdgeInsets.all(15),
            itemBuilder: (_, index) {

              final data = trx[index];

              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.black.withOpacity(.1),
                    )),
                child: ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text(data.paymentMethod ?? '',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amount: 500 BDT',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(data.requestNumber ?? '',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(data.methodType == null ? '' : data.methodType!.replaceAll('\\n ', '\n'),
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  trailing: Text(data.status == '1' ? 'Pending' : data.status == '2' ? 'Confirmed' : 'Rejected',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: data.status == '1' ? Colors.amber : data.status == '2' ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (_, index) => const SizedBox(
              height: 10,
            ),
          );
        }
      }),
    );
  }
}
