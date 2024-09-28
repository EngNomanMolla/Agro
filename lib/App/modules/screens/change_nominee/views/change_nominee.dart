import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppElevatedButtonWidget.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppTextFieldWidget.dart';
import 'package:smart_biniyog/App/modules/screens/change_nominee/controller/Change_Nominee.dart';
class ChangeNomineeScreen extends GetView<ChangeNomineeController> {
  ChangeNomineeScreen({Key? key}) : super(key: key);

  final TextEditingController _NameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _NIDController = TextEditingController();

  final TextEditingController _RelationlController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ChangeNomineeController changeNomineeController=Get.put(ChangeNomineeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text('Update Nominee Info')),),

        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child:Form(
                key: _formKey,
                child: Column(
                  children: [

                    AppTextFieldWidget(
                      controller: _NameController,
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
                      controller: _phoneController,
                      hintText: 'phone Num',
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    AppTextFieldWidget(
                      controller: _NIDController,
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
                      controller: _RelationlController,
                      hintText: 'Relationship',
                      //suffixIcon: IconButton(onPressed: (){ }, icon: const Icon(Icons.calendar_month_sharp),),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your WhatsApp number';
                        }
                        return null;
                      },
                    ),


                    const SizedBox(height: 12),
                    GetBuilder<ChangeNomineeController>(
                      builder: (ChangeNomineeController) {
                        return Container(
                          height: 48,
                          width: 358,
                          child: AppElevatedButton(
                            Color: Colors.green,
                            onTap: () async {
                              // personInfoController.profileUpdate();
                              if (_formKey.currentState!.validate()) {

                                ChangeNomineeController.NomineeInfChange(
                                     _NameController.text.trim(),
                                     _phoneController.text.trim(),
                                     _NIDController.text.trim(),
                                     _RelationlController.text.trim(),

                                  );


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
                          ),
                        );
                      }
                    ),




                  ],
                ),
              ),
            )
        )
    );
  }
}