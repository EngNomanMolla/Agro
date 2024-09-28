import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:smart_biniyog/App/modules/Screens/auth/controllers/auth_controller.dart';

import 'package:smart_biniyog/App/modules/utils/TextStyles.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';




class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {});

    Get.toNamed(RouteNames.splashScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DashBoardController>(
        builder: (context) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 250,
                    width: 250,
                    child: Image.asset(
                      'assets/images/smart_biniyog.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text('SMART ',
                //
                //     style: TitleTextStyle.copyWith(color: greyColor),
                //     ),
                //     Text('BINIYOG ',
                //
                //     style: TitleTextStyle.copyWith(color: primaryColor),
                //
                //     ),
                //   ],
                // )
                Center(
                    child: Text(
                  'Happy Farmer,Happy Nation',
                  style: SubTitleTextStyle,
                )),
              ],
            ),
          );
        }
      ),
    );
  }
}
