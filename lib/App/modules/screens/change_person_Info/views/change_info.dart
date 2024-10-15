import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppElevatedButtonWidget.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppTextFieldWidget.dart';
import 'package:smart_biniyog/App/modules/screens/change_person_Info/controller/changeper-controller.dart';
import 'package:smart_biniyog/App/modules/utils/snackbar_message.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';

import '../../../../data/model/personInfo.dart';

class ChangePerInfo extends StatefulWidget {
  const ChangePerInfo({Key? key}) : super(key: key);

  @override
  State<ChangePerInfo> createState() => _ChangePerInfoState();
}

class _ChangePerInfoState extends State<ChangePerInfo> {
  static final info = Get.arguments as PersonInfoModel;



  int _val = 1;
  String? _val1 = info.client!.gender;
  final TextEditingController _nameController =
      TextEditingController(text: info.client!.name);
  final TextEditingController _EmailController =
      TextEditingController(text: info.client!.email);
  final TextEditingController _PhnNumController =
      TextEditingController(text: info.client!.phone);

  final TextEditingController _address =
  TextEditingController(text: info.client!.address);

  final TextEditingController _DateBirthlController = TextEditingController();
  final TextEditingController _nid_backlController = TextEditingController();
  final TextEditingController _nid_frontPartlController =
      TextEditingController();
  final TextEditingController _TINController =
      TextEditingController(text: info.client!.tin);
  final TextEditingController _nidNumController =
      TextEditingController(text: info.client!.nid);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // The current date as the initial date
      firstDate: DateTime(1900), // Earliest selectable date
      lastDate: DateTime(2100), // Latest selectable date
    );

    if (picked != null) {
      setState(() {
        _DateBirthlController.text = "${picked.toLocal()}"
            .split(' ')[0]; // Update the TextField with the selected date
      });
    }
  }

  bool isLoading = false;

  updateProfileData() async {

    setState(() {
      isLoading = true;
    });

    final response = await NetworkUtils().updatePersonalInfo(
      personalInfo: {
        'name' : _nameController.text,
        'phone' : _PhnNumController.text,
        'address' : _address.text,
        'email' : _EmailController.text,
        'date_of_birth' : _DateBirthlController.text,
        'nid' : _nidNumController.text,
        'tin' : _TINController.text,
        'gender' : _val1,
      },
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      Get.offAllNamed(RouteNames.mainNavigationScreen);
      showSnackBarMessage(context, 'Profile updated success');
    } else {
      showSnackBarMessage(context, 'Something is wrong');
    }
  }

  @override
  Widget build(BuildContext context) {

    print(info.client!.name);

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Update Personal Info')),
        ),
        body: SingleChildScrollView(child: GetBuilder<ChangePerInfoController>(
            builder: (ChangePerInfoController) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Divider(
                    color: Colors.grey,
                    // height: 10,
                    thickness: 2,
                    // indent: 20,
                    // endIndent: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                          value: 1,
                          groupValue: _val,
                          onChanged: (value) {
                            setState(() {
                              _val = value!;
                              print("Button value: $_val");
                            });
                          }),
                      Text(
                        'individual user',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      Radio(
                          value: 2,
                          groupValue: _val,
                          onChanged: (value) {
                            setState(() {
                              _val = value!;
                              print("Button value: $_val");
                            });
                          }),
                      Text(
                        'Enterprise User',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  AppTextFieldWidget(
                    controller: _nameController,
                    hintText: 'Name',
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  AppTextFieldWidget(
                    controller: _PhnNumController,
                    hintText: 'Phn Num',
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  AppTextFieldWidget(
                    controller: _address,
                    hintText: 'Address',
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  AppTextFieldWidget(
                    controller: _EmailController,
                    hintText: 'Email',
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your WhatsApp number';
                      }
                      return null;
                    },
                  ),
                  // const SizedBox(height: 12),
                  // AppTextFieldWidget(
                  //   controller: _DateBirthlController,
                  //   hintText: 'Date Of Birth',
                  //   suffixIcon: IconButton(
                  //     onPressed: () {
                  //       _selectDate(context);
                  //     },
                  //     icon: const Icon(Icons.calendar_month_sharp),
                  //   ),
                  //   validator: (value) {
                  //     if (value?.isEmpty ?? true) {
                  //       return 'Please enter your WhatsApp number';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  const SizedBox(height: 12),
                  AppTextFieldWidget(
                    controller: _nidNumController,
                    hintText: 'NID',
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your WhatsApp number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  AppTextFieldWidget(
                    controller: _TINController,
                    hintText: 'TIN',
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your WhatsApp number';
                      }
                      return null;
                    },
                  ),
                  // const SizedBox(height: 12),
                  // AppTextFieldWidget(
                  //   controller: _nid_frontPartlController,
                  //   hintText: 'nid_frontPart',
                  //   validator: (value) {
                  //     if (value?.isEmpty ?? true) {
                  //       return 'Please enter your WhatsApp number';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // const SizedBox(height: 12),
                  // AppTextFieldWidget(
                  //   controller: _nid_backlController,
                  //   hintText: 'nid_backPart',
                  //   validator: (value) {
                  //     if (value?.isEmpty ?? true) {
                  //       return 'Please enter your WhatsApp number';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  const SizedBox(height: 12),
                  Text(
                    'Gender',
                    style: TextStyle(fontSize: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<String>(
                          value: 'male',
                          groupValue: _val1,
                          onChanged: (value) {
                            setState(() {
                              _val1 = value!;
                              print("Button value: $_val1");
                            });
                          }),
                      Text(
                        'Male',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      Radio<String>(
                          value: 'female',
                          groupValue: _val1,
                          onChanged: (value) {
                            setState(() {
                              _val1 = value!;
                              print("Button value: $_val1");
                            });
                          }),
                      Text(
                        'Female',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      Radio<String>(
                          value: 'others',
                          groupValue: _val1,
                          onChanged: (value) {
                            setState(() {
                              _val1 = value!;
                              print("Button value: $_val1");
                            });
                          }),
                      Text(
                        'Other',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      Radio<String>(
                          value: "N/A",
                          groupValue: _val1,
                          onChanged: (value) {
                            setState(() {
                              _val1 = value!;
                              print("Button value: $_val1");
                            });
                          }),
                      Text(
                        'N/A',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Divider(
                    color: Colors.grey,
                    // height: 10,
                    thickness: 2,
                    // indent: 20,
                    // endIndent: 20,
                  ),
                  Container(
                    height: 48,
                    width: 358,
                    child: AppElevatedButton(
                      Color: Colors.green,
                      onTap: () async {

                        updateProfileData();

                        // personInfoController.profileUpdate();
                        // if (_formKey.currentState!.validate()) {
                        //
                        //   Map <String,dynamic>data= {
                        //     "name":  _nameController.text.trim(),
                        // "email":   _EmailController.text.trim(),
                        // "phone": _PhnNumController.text.trim(),
                        // //"address": "123 Elm Street, Springfield",
                        // "nid":    _DateBirthlController.text.trim(),
                        // "tin":  _TINController.text.trim(),
                        // //"image": "path/to/image.jpg",
                        // "nid_f":_nid_frontPartlController.text.trim(),
                        // "nid_b":     _nid_backlController.text.trim(),
                        // //"gender":gen,
                        // "client_type":_val.toString(),
                        // };
                        //   personInfoController.profileUpdate(data);
                        //
                        //
                        //
                        //
                        //
                        //   //  PersonInfoController.ProfileUpdate(
                        //   //   _nameController.text.trim(),
                        //   //   _EmailController.text.trim(),
                        //   //   _PhnNumController.text.trim(),
                        //   //   _DateBirthlController.text.trim(),
                        //   //   _TINController.text.trim(),
                        //   //   _nid_frontPartlController.text.trim(),
                        //   //   _nid_backlController.text.trim(),
                        //   //   _val.toString(),
                        //   // );
                        //
                        //   // if (result != null && result['status'] == 'true') {
                        //   //  print(result);
                        //   //
                        //   //   showSnackBarMessage(
                        //   //       context, 'OTP sent to the email address');
                        //   // } else {
                        //   //   showSnackBarMessage(
                        //   //       context, 'OTP sent failed. Try again.', true);
                        //   //
                        //   //
                        //   //
                        //   // }
                        //
                        //
                        //
                        //
                        //
                        //   // String text = _emailETController.text;
                        //   // print(arguments['email']);
                        //   //      final result = await NetworkUtils().postMethod(
                        //   //        'https://test.smartbiniyog.com/api/client-v1/submit-login',
                        //   //        body: {
                        //   //          'contact':arguments['email'].toString(),
                        //   //          'otp': _otpPinETController.text.trim(),
                        //   //        },
                        //   //      );
                        //   //      Get.toNamed(RouteNames.mainNavigationScreen);
                        //   // // print(result);
                        //   // //      if (result!= null && result['status'] == 'true') {
                        //   // //        Get.toNamed(RouteNames.mainNavigationScreen);
                        //   // //        showSnackBarMessage(
                        //   // //            context, 'Registration successful!');
                        //   // //      } else {
                        //   // //        showSnackBarMessage(context,
                        //   // //            'Registration Failed! Try again', true);
                        //        // }
                        //
                        // }
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
                    ),
                  ),
                ],
              ),
            ),
          );
        })));
  }
}
