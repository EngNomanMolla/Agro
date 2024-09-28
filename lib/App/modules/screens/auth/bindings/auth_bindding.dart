import 'package:get/get.dart';
import 'package:smart_biniyog/App/modules/Screens/auth/controllers/auth_controller.dart';

class DashBoardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardController());
  }
}


class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}


class LogInBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LogInScreenController());
  }
}


class PhnEmailOtpBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PhnEmailOtpController());
  }
}