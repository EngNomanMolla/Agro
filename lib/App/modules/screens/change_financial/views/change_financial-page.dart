import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppElevatedButtonWidget.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppTextFieldWidget.dart';
import 'package:smart_biniyog/App/modules/screens/change_financial/controller/change_financial.dart';
import 'package:smart_biniyog/App/modules/screens/mbanking%20change/controller/m_controller.dart';
import 'package:smart_biniyog/App/modules/utils/snackbar_message.dart';

class ChangeFinancialScreen extends GetView<ChangeFinancialController> {
   ChangeFinancialScreen({Key? key}) : super(key: key);

  final TextEditingController _BankController = TextEditingController();

  final TextEditingController _AccountNameController = TextEditingController();

  final TextEditingController _BranchController = TextEditingController();

  final TextEditingController _AccountNumlController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   ChangeFinancialController changeFinancialController=Get.put(ChangeFinancialController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text('Update Bank Info')),),

        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child:Form(
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
                               // // Get.toNamed(RouteNames.phnEmailOtpScreen);
                              //  print(_emailETController.text.trim());
                                final result = await ChangeFinancialController.bankingInfoChange(
                                 // _TrxIDETController.text.trim(),
                                  _BankController.text.trim(),
                                    _AccountNameController.text.trim(),

                                     _BranchController.text.trim(),
                                  _AccountNumlController.text.trim(),
                                );

                                if (result != null && result['status'] == 'true') {


                                  showSnackBarMessage(
                                      context, 'OTP sent to the email address');
                                } else {
                                  showSnackBarMessage(
                                      context, 'OTP sent failed. Try again.', true);


                               //  //   //String text = _emailETController.text;
                               //  //
                               //  //   // final result = await NetworkUtils().postMethod(
                               //  //   //   'https://test.smartbiniyog.com/api/client-v1/send-otp',
                               //  //   //   body: {
                               //  //   //     'contact': _emailETController.text.trim(),
                               //  //   //   },
                               //  //   // );
                               //  //   //
                               //  //   // if (result != null && result['status'] == 'true') {
                               //  //   //   Get.toNamed(RouteNames.phnEmailOtpScreen,
                               //  //   //       arguments: {'email':_emailETController.text}
                               //  //   //   );
                               //  //   //   showSnackBarMessage(
                               //  //   //       context, 'Registration successful!');
                               //  //   // } else {
                               //  //   //   showSnackBarMessage(context,
                               //  //   //       'Registration Failed! Try again', true);
                               //  //   // }
                                 }




                            },
                            child: Center(
                              child: Text(
                                "Update",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      ),
                    ),




                  ],
                ),
              ),
            )
        )
    );
  }
}
