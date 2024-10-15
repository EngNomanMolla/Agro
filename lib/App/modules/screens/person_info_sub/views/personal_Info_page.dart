import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:smart_biniyog/App/modules/Screens/person_info/controller/person_info_controller.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppElevatedButtonWidget.dart';

import 'package:smart_biniyog/App/modules/Widgets/AppTextFieldWidget.dart';
import 'package:smart_biniyog/App/modules/screens/person_info_sub/controller/person_info_controller.dart';
import 'package:smart_biniyog/App/modules/utils/snackbar_message.dart';

class PersonInfoScreen extends StatefulWidget {
  const PersonInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonInfoScreen> createState() => _PersonInfoScreenState();
}

class _PersonInfoScreenState extends State<PersonInfoScreen> {
  PersonInfoController personInfoController = Get.put(PersonInfoController());
  int _val = 1;
  String? _val1 = " ";
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _PhnNumController = TextEditingController();
  final TextEditingController _DateBirthlController = TextEditingController();
  final TextEditingController _nidlController = TextEditingController();
  final TextEditingController _imagelController = TextEditingController();
  final TextEditingController _nid_backlController = TextEditingController();
  final TextEditingController _nid_frontPartlController =
      TextEditingController();
  final TextEditingController _TINController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Complete Profile')),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(24.0),
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
                Text(
                  'Personal Information',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.perm_identity_outlined,
                    size: 80,
                  ),
                ),
                SizedBox(
                  height: 10,
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
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
                  controller: _EmailController,
                  hintText: 'Email',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your WhatsApp number';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),
                AppTextFieldWidget(
                  controller: _DateBirthlController,
                  hintText: 'Date Of Birth',
                  suffixIcon: IconButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    icon: const Icon(Icons.calendar_month_sharp),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your WhatsApp number';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                AppTextFieldWidget(
                  controller: _nidlController,
                  hintText: 'nid',
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
                //   controller: _imagelController,
                //   hintText: 'image',
                //   validator: (value) {
                //     if (value?.isEmpty ?? true) {
                //       return 'Please enter your WhatsApp number';
                //     }
                //     return null;
                //   },
                // ),
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
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

                GetBuilder<PersonInfoController>(
                    builder: (PersonInfoController) {
                  return Container(
                    height: 48,
                    width: 358,
                    child: AppElevatedButton(
                      Color: Colors.green,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          //   Map <String,dynamic>data= {
                          //     "name":  _nameController.text.trim(),
                          // "email":   _EmailController.text.trim(),
                          // "phone": _PhnNumController.text.trim(),
                          // "address": "123 Elm Street, Springfield",
                          // "nid":    _DateBirthlController.text.trim(),
                          // "tin":  _TINController.text.trim(),
                          // "image": "path/to/image.jpg",
                          // "nid_f":_nid_frontPartlController.text.trim(),
                          // "nid_b":     _nid_backlController.text.trim(),
                          // "gender":'gen',
                          // "client_type":_val.toString(),
                          // };
                          // personInfoController.profileUpdate(data);

                          PersonInfoController.profileInfoSubmit(
                            _val.toString(),
                            _nameController.text.trim(),
                            _PhnNumController.text.trim(),
                            _EmailController.text.trim(),
                            _DateBirthlController.text.trim(),
                            _nidlController.text.trim(),
                            _TINController.text.trim(),
                            // _imagelController.text.trim(),
                            //_nid_frontPartlController.text.trim(),
                            //_nid_backlController.text.trim(),
                            _val1.toString(),
                          );

                          // if (result != null && result['status'] == 'true') {
                          //  print(result);
                          //
                          //   showSnackBarMessage(
                          //       context, 'OTP sent to the email address');
                          // } else {
                          //   showSnackBarMessage(
                          //       context, 'OTP sent failed. Try again.', true);
                          //
                          //
                          //
                          // }
                        }
                      },
                      child: Center(
                        child: Text(
                          "Save & Continue",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        )));
  }
}
