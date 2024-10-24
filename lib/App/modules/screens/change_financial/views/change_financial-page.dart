import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_biniyog/App/data/model/personInfo.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppElevatedButtonWidget.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppTextFieldWidget.dart';
import 'package:smart_biniyog/App/modules/screens/change_financial/controller/change_financial.dart';
import 'package:smart_biniyog/App/modules/screens/mbanking%20change/controller/m_controller.dart';
import 'package:smart_biniyog/App/modules/utils/snackbar_message.dart';

class ChangeFinancialScreen extends StatefulWidget {
  ChangeFinancialScreen({Key? key}) : super(key: key);

  @override
  State<ChangeFinancialScreen> createState() => _ChangeFinancialScreenState();
}

class _ChangeFinancialScreenState extends State<ChangeFinancialScreen> {

  static final client = Get.arguments as PersonInfoModel;

  final TextEditingController _BankController = TextEditingController(text: client.client!.banking!.bankName ?? '');

  final TextEditingController _AccountNameController = TextEditingController(text: client.client!.banking!.acName ?? '');

  final TextEditingController _BranchController = TextEditingController(text: client.client!.banking!.branchName ?? '');

  final TextEditingController _AccountNumlController = TextEditingController(text: client.client!.banking!.acNo ?? '');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ChangeFinancialController changeFinancialController =
      Get.put(ChangeFinancialController());

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Update Bank Info')),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AppTextFieldWidget(
                  controller: _BankController,
                  hintText: 'Bank Name',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                AppTextFieldWidget(
                  controller: _AccountNameController,
                  hintText: 'Account Name',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your WhatsApp number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                AppTextFieldWidget(
                  controller: _BranchController,
                  hintText: 'Branch Name',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                AppTextFieldWidget(
                  controller: _AccountNumlController,
                  hintText: 'Account Num',
                  //suffixIcon: IconButton(onPressed: (){ }, icon: const Icon(Icons.calendar_month_sharp),),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your WhatsApp number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                Container(
                  height: 48,
                  width: 358,
                  child: GetBuilder<ChangeFinancialController>(
                      builder: (ChangeFinancialController) {
                        return AppElevatedButton(
                          Color: Colors.green,
                          onTap: () async {

                            isLoading = true;
                            setState(() {

                            });

                            await changeFinancialController.bankingInfoChange(
                              _BankController.text.trim(),
                              _AccountNameController.text.trim(),
                              _BranchController.text.trim(),
                              _AccountNumlController.text.trim(),
                            );

                            isLoading = false;
                            setState(() {

                            });
                          },
                          child: Center(
                            child: Text(
                              isLoading
                                  ? 'Updating...'
                                  : "Update",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        )));
  }
}
