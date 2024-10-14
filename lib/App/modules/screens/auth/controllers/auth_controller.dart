import 'package:get/get.dart';
import 'package:smart_biniyog/App/data/model/login_image_model.dart';
import 'package:smart_biniyog/App/data/service/data_saver.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/data/urls/urls.dart';
import 'package:smart_biniyog/App/modules/utils/snackbar_message.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';

class DashBoardController extends GetxController {
  String countryCode = "+880";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}

class LogInScreenController extends GetxController {
  bool loginInProgress = false;

  Future<dynamic> verifyEmailPhn(String email) async {
    loginInProgress = true;
    update();
    return await NetworkUtils()
        .authPostMethod(Urls.verifyEmailPhn, //final result =
            body: {
          'contact': email,
        });

    loginInProgress = false;
  }

  bool LogInImageProgress = false;
  LogInImageModel LogInDataModel = LogInImageModel();

  Future<bool> getLogInImage() async {
    LogInImageProgress = true;
    update();
    final response = await NetworkUtils().getMethod(
      Urls.businesstypeurl,
    );
    LogInImageProgress = false;

    print('log:$response');

    if (response != null) {
      LogInDataModel = LogInImageModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getLogInImage();
  }
}

class PhnEmailOtpController extends GetxController {
  final count = 0.obs;
  final _countDownSeconds = 60.obs;

  int get remainingCountDownSeconds => _countDownSeconds.value;

  @override
  void onInit() {
    super.onInit();
    _startCountdown();
  }

  bool loginInProgress = false;

  Future<dynamic> otpEmailPhn(String email, String otp) async {
    loginInProgress = true;
    update();
    final result =
        await NetworkUtils().authPostMethod(Urls.otpEmailPhn, //final result =
            body: {
          'contact': email,
          'otp': otp,
        });
    loginInProgress = false;

    if (result == false) {
      showSnackBarMessage(Get.context!, 'Invalid OTP Code');
      return;
    }


      await AuthUtils.saveUserData(
        result['token'],
      );

    Get.offAllNamed(RouteNames.mainNavigationScreen);

    // if (result != null && result['status'] == 'success') {
    //   await AuthUtils.saveUserData(
    //     result['token'],
    //   );
    //   update();
    //   return true;
    // } else {
    //   update();
    //   return false;
    // }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void _startCountdown() {
    // Start the countdown
    Future.delayed(const Duration(seconds: 1), () {
      _countDownSeconds.value--;
      if (_countDownSeconds.value > 0) {
        _startCountdown();
      }
    });
  }
}
