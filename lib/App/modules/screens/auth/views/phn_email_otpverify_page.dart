import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/modules/Screens/auth/controllers/auth_controller.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppElevatedButtonWidget.dart';
import 'package:smart_biniyog/App/modules/utils/snackbar_message.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';

class PhnEmailOtpVerifyScreen extends StatefulWidget {
  PhnEmailOtpVerifyScreen({Key? key}) : super(key: key);

  @override
  State<PhnEmailOtpVerifyScreen> createState() => _PhnEmailOtpVerifyScreenState();
}

class _PhnEmailOtpVerifyScreenState extends State<PhnEmailOtpVerifyScreen> {

  final TextEditingController _otpPinETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String _code = "";
  @override
  Widget build(BuildContext context) {
     final Map<String, String> arguments = Get.arguments;
    print(Get.arguments);

    return  Scaffold(
appBar: AppBar(
  title: Center(child: Text("Verify Number")),//${arguments['email']}
),


      body: Form(
    key: _formKey,
    child:Padding(
        padding: const EdgeInsets.all(24.0),
        child: GetBuilder<PhnEmailOtpController>(
          builder: (_) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Divider(
                    color: Colors.grey,
                    // height: 10,
                    thickness: 2,
                    // indent: 20,
                    // endIndent: 20,                      //${arguments['email']}
                  ),
Text('please enter the verification code sent to \n  this number ${arguments['email']} '),
                  SizedBox(height: 6,),
                  Text('change Number'),
                  SizedBox(height: 6,),
                  Text(
                    'Verification Code' ,

                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  PinCodeTextField(
                    controller: _otpPinETController,
                    length: 5,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a PIN';
                      } else if (value.length < 5) {
                        return 'PIN must be 5 digits';
                      }
                      return null;
                    },
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      selectedColor: Colors.green,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    onCompleted: (pin) {
                      print("Completed:$pin");
                    },
                    onChanged: (value) {
                      print(value);
                      setState(() {});
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    }, appContext: context,

                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GetBuilder<PhnEmailOtpController>(
                    builder: (PhnEmailOtpController) {
                      return AppElevatedButton(
                          Color: Colors.green,

                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                         Get.toNamed(RouteNames.mainNavigationScreen);
                              print(arguments['email']);
                              final response = await PhnEmailOtpController.otpEmailPhn(
                                arguments['email'].toString(),
                                _otpPinETController.text.trim(),
                              );
                              Get.toNamed(RouteNames.mainNavigationScreen);
                              // if (response) {
                              //   Get.toNamed(RouteNames.mainNavigationScreen);
                              // } else {
                              //   Get.showSnackbar(
                              //     const GetSnackBar(
                              //       title: 'Login failed! Try again.',
                              //     ),
                              //   );
                              // }



                             //  if (response != null && response['status'] == 'true') {
                             //   print(response);
                             //    Get.toNamed(RouteNames.mainNavigationScreen);
                             //    showSnackBarMessage(
                             //        context, 'OTP sent to the email address');
                             //  } else {
                             //    showSnackBarMessage(
                             //        context, 'OTP sent failed. Try again.', true);
                             //  }
                             //




                         //     // String text = _emailETController.text;
                         // print(arguments['email']);
                         //      final result = await NetworkUtils().postMethod(
                         //        'https://test.smartbiniyog.com/api/client-v1/submit-login',
                         //        body: {
                         //          'contact':arguments['email'].toString()
                         //          'otp': _otpPinETController.text.trim(),
                         //        },
                         //      );
                         //      Get.toNamed(RouteNames.mainNavigationScreen);
                         // // print(result);
                         // //      if (result!= null && result['status'] == 'true') {
                         // //        Get.toNamed(RouteNames.mainNavigationScreen);
                         // //        showSnackBarMessage(
                         // //            context, 'Registration successful!');
                         // //      } else {
                         // //        showSnackBarMessage(context,
                         // //            'Registration Failed! Try again', true);
                         // //      }

                            }
                          },
                        child: const Text('Verify',style: TextStyle(color: Colors.white,fontSize: 15),),
                          );
                    }
                  ),
                  SizedBox(height: 10,),
                  Row(children: [
                    Text('Do not receive code ? Resend Code in'),
                    SizedBox(width: 5,),
      Text(
      '2.3 sec',
      style: TextStyle(color: Colors.deepOrange),),



                  ],)

                ],
              ),
            );
          }
        ),
      ),

      )
    );
  }
}
