import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_biniyog/App/modules/screens/personal_info/controlar/personal_controller.dart';
import 'package:smart_biniyog/App/modules/screens/profile/controller/profile_controller.dart';
import 'package:smart_biniyog/App/modules/screens/withdraw/controller/withdraw_controller.dart';
import 'package:smart_biniyog/App/modules/screens/withdraw_history/views/withdraw_history.dart';

import '../../../Widgets/AppElevatedButtonWidget.dart';
import '../../../Widgets/AppTextFieldWidget.dart';
import '../../mbanking/controller/controller_page.dart';

class WithdrawView extends StatefulWidget {
  const WithdrawView({super.key});

  @override
  State<WithdrawView> createState() => _WithdrawViewState();
}

class _WithdrawViewState extends State<WithdrawView> {
  bool isLoading = true;
  int? selected;

  final controller = Get.put(WithdrawController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => WithdrawHistoryView()),
            icon: Icon(
              Icons.history,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Color(0xff38b579),
        title: Text('Withdraw', style: TextStyle(color: Colors.white)),
      ),
      body: GetBuilder<WithdrawController>(builder: (controller) {
        if (controller.personInfoProgress.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Color(0xff38b579),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Balance',
                      style: TextStyle(
                        color: Colors.white.withOpacity(.5),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '৳${controller.personInfoDataModel.client!.allBalance!.restBalance}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Amount',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppTextFieldWidget(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        controller: controller.amount,
                        hintText: 'Enter amount',
                        prefixIcon: Icon(
                          Icons.attach_money,
                          color: Colors.black.withOpacity(.5),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a amount.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Withdraw Method',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => controller.changeIndex(0),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: controller.selected != null &&
                                            controller.selected!.value == 0
                                        ? Color(0xff38b579).withOpacity(.050)
                                        : null,
                                    border: Border.all(
                                      color: controller.selected != null &&
                                              controller.selected!.value == 0
                                          ? Color(0xff38b579)
                                          : Colors.black.withOpacity(.1),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    'Mobile Banking',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: controller.selected != null &&
                                              controller.selected!.value == 0
                                          ? Color(0xff38b579)
                                          : Colors.black.withOpacity(.5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () => controller.changeIndex(1),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: controller.selected != null &&
                                            controller.selected!.value == 1
                                        ? Color(0xff38b579).withOpacity(.050)
                                        : null,
                                    border: Border.all(
                                      color: controller.selected != null &&
                                              controller.selected!.value == 1
                                          ? Color(0xff38b579)
                                          : Colors.black.withOpacity(.1),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    'Bank Transfer',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: selected != null && selected == 1
                                          ? Color(0xff38b579)
                                          : Colors.black.withOpacity(.5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.selected == null
                            ? []
                            : controller.selected == 1
                                ? [
                                    Text(
                                      'Bank Name',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    AppTextFieldWidget(
                                      enabled: false,
                                      controller: TextEditingController(),
                                      hintText:
                                          '${controller.personInfoDataModel.client!.banking == null ? 'No Data' : controller.personInfoDataModel.client!.banking!.bankName}',
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Branch Name',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    AppTextFieldWidget(
                                      enabled: false,
                                      controller: TextEditingController(),
                                      hintText:
                                          '${controller.personInfoDataModel.client!.banking == null ? 'No Data' : controller.personInfoDataModel.client!.banking!.branchName}',
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'A/C Name',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    AppTextFieldWidget(
                                      enabled: false,
                                      controller: TextEditingController(),
                                      hintText:
                                          '${controller.personInfoDataModel.client!.banking == null ? 'No Data' : controller.personInfoDataModel.client!.banking!.acName}',
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'A/C No',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    AppTextFieldWidget(
                                      enabled: false,
                                      controller: TextEditingController(),
                                      hintText:
                                          '${controller.personInfoDataModel.client!.banking == null ? 'No Data' : controller.personInfoDataModel.client!.banking!.acNo}',
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Routing Number',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    AppTextFieldWidget(
                                      enabled: false,
                                      controller: TextEditingController(),
                                      hintText:
                                          '${controller.personInfoDataModel.client!.banking == null ? 'No Data' : controller.personInfoDataModel.client!.banking!.routingNumber}',
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Swift Code',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    AppTextFieldWidget(
                                      enabled: false,
                                      controller: TextEditingController(),
                                      hintText:
                                          '${controller.personInfoDataModel.client!.banking == null ? 'No Data' : controller.personInfoDataModel.client!.banking!.swiftCode}',
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'If you want to change your wallet information please navigate to setting and change the info there.',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(.5),
                                        fontSize: 11,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ]
                                : [
                                    Text(
                                      'Wallet Name',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    AppTextFieldWidget(
                                      enabled: false,
                                      controller: TextEditingController(),
                                      hintText:
                                          '${controller.personInfoDataModel.client!.banking == null ? 'No Data' : controller.personInfoDataModel.client!.mfs!.mfsName}',
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Wallet Type',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    AppTextFieldWidget(
                                      enabled: false,
                                      controller: TextEditingController(),
                                      hintText:
                                          '${controller.personInfoDataModel.client!.banking == null ? 'No Data' : controller.personInfoDataModel.client!.mfs!.mfsType}',
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Wallet Number',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    AppTextFieldWidget(
                                      enabled: false,
                                      controller: TextEditingController(),
                                      hintText:
                                          '${controller.personInfoDataModel.client!.banking == null ? 'No Data' : controller.personInfoDataModel.client!.mfs!.mfsNumber}',
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'If you want to change your wallet information please navigate to setting and change the info there.',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(.5),
                                        fontSize: 11,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                      )
                    ],
                  ),
                ),
              ),
              Obx(
                () => AppElevatedButton(
                  Color: Color(0xff38b579),
                  onTap: controller.submitWithdraw,
                  child: Text(
                    controller.isLoading.value
                        ? 'Requesting...'
                        : "Withdraw Now",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      }),
    );
  }
}
