import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_biniyog/App/data/model/personInfo.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppElevatedButtonWidget.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppTextFieldWidget.dart';
import 'package:smart_biniyog/App/modules/screens/change_nominee/controller/Change_Nominee.dart';
import 'package:smart_biniyog/App/modules/utils/snackbar_message.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';

class ChangeNomineeScreen extends StatefulWidget {
  ChangeNomineeScreen({Key? key}) : super(key: key);

  static final info = Get.arguments as PersonInfoModel;

  @override
  State<ChangeNomineeScreen> createState() => _ChangeNomineeScreenState();
}

class _ChangeNomineeScreenState extends State<ChangeNomineeScreen> {
  final TextEditingController _NameController = TextEditingController(
      text: ChangeNomineeScreen.info.client!.nominee == null ? '' : ChangeNomineeScreen.info.client!.nominee!.name);

  final TextEditingController _phoneController = TextEditingController(
      text: ChangeNomineeScreen.info.client!.nominee == null ? '' : ChangeNomineeScreen.info.client!.nominee!.phone);

  final TextEditingController _NIDController = TextEditingController(
      text: ChangeNomineeScreen.info.client!.nominee == null ? '' : ChangeNomineeScreen.info.client!.nominee!.nid);

  final TextEditingController _RelationlController = TextEditingController(
      text: ChangeNomineeScreen.info.client!.nominee == null
          ? ''
          : ChangeNomineeScreen.info.client!.nominee!.relationship);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ChangeNomineeController changeNomineeController =
      Get.put(ChangeNomineeController());

  bool isLoading = false;

  void updateNomineeInfo() async {

    isLoading = true;
    setState(() {

    });

    final response = await NetworkUtils().updateNominee(info: {
      "name": _NameController.text,
      "phone": _phoneController.text,
      "nid": _NIDController.text,
      "relationship": _RelationlController.text,
    });

    isLoading = false;
    setState(() {

    });

    if (response.statusCode == 200) {
      Get.offAllNamed(RouteNames.mainNavigationScreen);
      showSnackBarMessage(Get.context!, 'Nominee successfully updated');
    } else {
      showSnackBarMessage(Get.context!, 'Something is wrong, Please try again');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Update Nominee Info')),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
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
                          updateNomineeInfo();
                        }
                      },
                      child: Center(
                        child: Text(
                          isLoading ? 'Loading...' : "Update",
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
