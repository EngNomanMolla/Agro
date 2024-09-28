import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppElevatedButtonWidget.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppTextFieldWidget.dart';
import 'package:smart_biniyog/App/modules/screens/mbanking%20change/controller/m_controller.dart';
import 'package:smart_biniyog/App/modules/utils/snackbar_message.dart';

class MobileBankingChange extends StatefulWidget {
  const MobileBankingChange({Key? key}) : super(key: key);

  @override
  State<MobileBankingChange> createState() => _MobileBankingChangeState();
}

class _MobileBankingChangeState extends State<MobileBankingChange> {
  final TextEditingController _nameETController = TextEditingController();
  final TextEditingController _AmountETController = TextEditingController();
  final TextEditingController _typeIDETController = TextEditingController();
  final TextEditingController _RateRETController = TextEditingController();
  final TextEditingController _PhNumETController = TextEditingController();
  final TextEditingController _shortNameETController = TextEditingController();
  // ChangeBankingController changeBankingController=Get.put(ChangeBankingController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool m = true;
  bool _isLoading = false;
  String? _selectedGateway;
  final List<String> _gateways = ['Bkash', 'Nagad'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Update Mobile banking Info')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text('Payment Information',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color(0xFF6A7189),
                        fontSize: 16,
                      ),
                    )),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _selectedGateway,
                  hint: Text('Select Payment Gateway'),
                  items: _gateways.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGateway = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a payment gateway';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                AppTextFieldWidget(
                  controller: _typeIDETController,
                  hintText: 'Account type',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Wrong Number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                AppTextFieldWidget(
                  controller: _PhNumETController,
                  hintText: 'PhNum',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Wrong Number';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                GetBuilder<ChangeBankingController>(
                    builder: (ChangeBankingController) {
                  return Container(
                    height: 48,
                    width: 358,
                    child: _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : AppElevatedButton(
                            Color: Colors.green,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                               // print(_selectedGateway);
                                // // Get.toNamed(RouteNames.phnEmailOtpScreen);
                                //  print(_emailETController.text.trim());
                                final result = await ChangeBankingController
                                    .MbankingInfChange(
                                  _selectedGateway!,
                                  _typeIDETController.text.trim(),
                                  _PhNumETController.text.trim(),
                                );
                                if (result['status'] == 'true') {
                                  showSnackBarMessage(
                                      context, 'OTP sent to the email address');
                                } else {
                                  showSnackBarMessage(context,
                                      'OTP sent failed. Try again.', true);
                                }
                              }
                            },
                            child: Center(
                              child: Text(
                                "submit",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  );
                }),
                const SizedBox(height: 14),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
