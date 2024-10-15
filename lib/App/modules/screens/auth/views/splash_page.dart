import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:smart_biniyog/App/data/service/data_saver.dart';
import 'package:smart_biniyog/App/modules/Screens/auth/controllers/auth_controller.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';



class SplashScreen extends StatefulWidget {
   SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Get.toNamed(AuthUtils.isLoggedIn ? RouteNames.mainNavigationScreen : RouteNames.logInScreen);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: GetBuilder<SplashController>(
        builder: (context) {
          return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 10,
                backgroundColor: Colors.greenAccent,
              )
          );
        }
      ),
    );
  }
}
