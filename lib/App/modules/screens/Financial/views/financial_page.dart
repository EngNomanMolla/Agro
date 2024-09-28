import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_biniyog/App/modules/screens/Financial/controller/financial_controller.dart';
import 'package:smart_biniyog/App/modules/screens/change_financial/views/change_financial-page.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';

class FinancialScreen extends GetView<FinancialController> {
   FinancialScreen({Key? key}) : super(key: key);
  FinancialController financialController=Get.put(FinancialController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:GetBuilder<FinancialController>(builder: (FinancialController) {
        return FinancialController.getpersonInfoProgress
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : RefreshIndicator(
          onRefresh: () async {
            FinancialController.GetPersonInfoModel();
          },
          child: Column(
            children: [

              ListTile(
                title: Text('Bank Informaion',style:TextStyle(fontWeight:FontWeight.bold)),
                trailing: TextButton(onPressed: () {
                  Get.toNamed(RouteNames.changeFinancialInfo);


                }, child: Text('Change'),),

              ),

              SizedBox(
                height: 3,
              ),

              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  // height: 310,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      ListTile(
                        iconColor: Colors.black,
                        trailing: Text('${FinancialController.bankingInfoDataModel.client!.banking?.bankName}', style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),),
                        title: Text(
                          'Bank Name ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        iconColor: Colors.black,
                        trailing: Text('${FinancialController.bankingInfoDataModel.client!.banking?.branchName}', style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),),
                        title: Text(
                          'Branch Name ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        iconColor: Colors.black,
                        trailing: Text('${FinancialController.bankingInfoDataModel.client!.banking?.acName}', style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),),
                        title: Text(
                          'A/C Name ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        iconColor: Colors.black,
                        trailing: Text('${FinancialController.bankingInfoDataModel.client!.banking?.acNo}', style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),),
                        title: Text(
                          'A/C No ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              ),



            ],
          ),
        );
      }),





    );
  }
}
