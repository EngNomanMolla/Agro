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

  bool _isLoading = false;

  bool _isSubmitted = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(token);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Center(child: const Text('My Farms')),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(RouteNames.myCardScreen);
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.grey,
              )),
        ],
      ),
      body: token == null
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
                            "you need to purchase project\nview the content of this page",
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
                                Get.offAllNamed(RouteNames.logInScreen);
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
                itemCount: 5,
                itemBuilder: (_, index) {
                  return CustomProjectWidget(index: index);
                },
              )
            ],
          ),
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
