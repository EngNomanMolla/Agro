import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_biniyog/App/data/service/data_saver.dart';
import 'package:smart_biniyog/App/modules/Screens/myfarm/controller/myfarm_controller.dart';
import 'package:smart_biniyog/App/modules/Screens/navigation_bar/controller/navigaion_controller.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppElevatedButtonWidget.dart';
import 'package:smart_biniyog/App/modules/widgets/custom_project_widget.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';

class MyFarmsScreen extends StatefulWidget {
  MyFarmsScreen({Key? key}) : super(key: key);

  @override
  State<MyFarmsScreen> createState() => _MyFarmsScreenState();
}

class _MyFarmsScreenState extends State<MyFarmsScreen> {
  String? token;

  getToken() async {
    token = await AuthUtils.getAuthData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  final controller = Get.put(MyFarmController());

  final nav = Get.put(NavigatinController());

  @override
  Widget build(BuildContext context) {
    print(token);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Center(child: const Text('My Farms')),
        actions: [
          // IconButton(
          //     onPressed: () {
          //       Get.toNamed(RouteNames.myCardScreen);
          //     },
          //     icon: Icon(
          //       Icons.shopping_cart,
          //       color: Colors.grey,
          //     )),
        ],
      ),
      body: !AuthUtils.isLoggedIn
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(
                    color: Colors.grey,
                    // height: 10,
                    thickness: 2,
                    // indent: 20,
                    // endIndent: 20,
                  ),
                  Expanded(
                      flex: 50,
                      child: Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Icon(
                            Icons.login_outlined,
                            size: 100,
                            color: Colors.deepOrange,
                          ))),
                  Expanded(
                    flex: 50,
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text(
                            'Login to Home',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "You should be logged in to access your purchased projects.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AppElevatedButton(
                              Color: Colors.green,
                              onTap: () {
                                Get.toNamed(RouteNames.logInScreen);
                              },
                              child: Text(
                                'Log In',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Obx(() => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : controller.myFarm.value.data!.isEmpty
                  ? Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Divider(
                            color: Colors.grey,
                            // height: 10,
                            thickness: 2,
                            // indent: 20,
                            // endIndent: 20,
                          ),
                          Expanded(
                              flex: 50,
                              child: Container(
                                  width: double.infinity,
                                  child: Icon(
                                    Icons.production_quantity_limits,
                                    size: 100,
                                    color: Colors.deepOrange,
                                  ))),
                          Expanded(
                            flex: 50,
                            child: Container(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Text(
                                    'No Project Found',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "you need to purchase project\nview the content of this page",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AppElevatedButton(
                                      Color: Colors.green,
                                      onTap: () {
                                        nav.changeIndex(0);
                                      },
                                      child: Text(
                                        'Go to project page ',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView(
                      children: [
                        ListView.builder(
                          padding: EdgeInsets.all(15),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: controller.myFarm.value.data!.length,
                          itemBuilder: (_, index) {
                            final data = controller.myFarm.value.data![index];

                            return CustomProjectWidget(
                              farm: data,
                            );
                          },
                        )
                      ],
                    )),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     if (_isSubmitted) ...[
      //       Form(
      //         key: _formKey,
      //         child: Column(
      //           children: <Widget>[
      //             Text('data'),
      //             const SizedBox(height: 12),
      //             Container(
      //               height: 48,
      //               width: 358,
      //               child: _isLoading
      //                   ? Center(child: CircularProgressIndicator())
      //                   : AppElevatedButton(
      //                       onTap: () {
      //                         if (_formKey.currentState!.validate()) {}
      //                       },
      //                       child: Center(
      //                         child: Text(
      //                           "Submit",
      //                           style: GoogleFonts.poppins(
      //                             textStyle: const TextStyle(
      //                               color: Colors.green,
      //                               fontSize: 14,
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ] else ...[
      //       // Confirmation message after form submission
      //       Divider(
      //         color: Colors.grey,
      //         // height: 10,
      //         thickness: 2,
      //         // indent: 20,
      //         // endIndent: 20,
      //       ),
      //       Expanded(
      //           flex: 50,
      //           child: Container(
      //               width: double.infinity,
      //               color: Colors.white,
      //               child: Icon(
      //                 Icons.login_outlined,
      //                 size: 100,
      //                 color: Colors.deepOrange,
      //               ))),
      //       Expanded(
      //         flex: 50,
      //         child: Container(
      //           width: double.infinity,
      //           child: Column(
      //             children: [
      //               Text(
      //                 'Login to Home',
      //                 style:
      //                     TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //               ),
      //               SizedBox(
      //                 height: 10,
      //               ),
      //               Text(
      //                 "you need to purchase project\nview the content of this page",
      //                 style:
      //                     TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      //               ),
      //               SizedBox(
      //                 height: 10,
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: AppElevatedButton(
      //                   Color: Colors.green,
      //                   onTap: () {
      //                     NavigatinController _navigatinController =
      //                         Get.put(NavigatinController());
      //                     // Get.toNamed(RouteNames.homeScreen);
      //                     _navigatinController.backToHome();
      //                   },
      //                   child: Text(
      //                     'Go to project page ',
      //                     style: TextStyle(color: Colors.white),
      //                   ),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ],
      // ),
    );
  }
}
