import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_biniyog/App/modules/screens/withdraw/controller/withdraw_controller.dart';

import '../../../Widgets/AppElevatedButtonWidget.dart';
import '../../../Widgets/AppTextFieldWidget.dart';

class WithdrawView extends StatefulWidget {
  const WithdrawView({super.key});

  @override
  State<WithdrawView> createState() => _WithdrawViewState();
}

class _WithdrawViewState extends State<WithdrawView> {

  int? selected;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(WithdrawController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff38b579),
        title: Text('Withdraw', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
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
                    '\$2640.00',
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
                      height: 30,
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
                      controller: TextEditingController(),
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
                            onTap: () => setState(() {
                              selected = 0;
                            }),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: selected != null && selected == 0 ? Color(0xff38b579).withOpacity(.050) : null,
                                  border: Border.all(
                                    color: selected != null && selected == 0 ? Color(0xff38b579) : Colors.black.withOpacity(.1),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Text('Mobile Banking',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: selected != null && selected == 0 ? Color(0xff38b579) : Colors.black.withOpacity(.5),
                                  ),),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                
                        Expanded(
                          child: InkWell(
                            onTap: () => setState(() {
                              selected = 1;
                            }),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: selected != null && selected == 1 ? Color(0xff38b579).withOpacity(.050) : null,
                                  border: Border.all(
                                    color: selected != null && selected == 1 ? Color(0xff38b579) : Colors.black.withOpacity(.1),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Text('Bank Transfer',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: selected != null && selected == 1 ? Color(0xff38b579) : Colors.black.withOpacity(.5),
                                  ),),
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
                      children: selected == null ? [] : selected == 1 ? [
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
                          hintText: 'Dutch Bangla Bank',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Branch',
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
                          hintText: 'Elenga Branch',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Branch',
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
                          hintText: 'Elenga Branch',
                        ),
                      ] : [
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
                          hintText: 'Dutch Bangla Bank',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Branch',
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
                          hintText: 'Elenga Branch',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Branch',
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
                          hintText: 'Elenga Branch',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            AppElevatedButton(
              Color: Color(0xff38b579),
              onTap: () {},
              child: Text(
                "Withdraw Now",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
