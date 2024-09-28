import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smart_biniyog/App/data/model/long_term.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/data/urls/urls.dart';

class LongTermController extends GetxController{




  @override
  void onInit() {
    getLongTermProcect();
    super.onInit();
  }

  bool longProjectProgress = false;
  LongTermModel LongProjectDataModel = LongTermModel();


  Future<bool> getLongTermProcect() async {
    longProjectProgress = true;
    update();
    final response = await NetworkUtils().getMethod(
      Urls.longtermprojecturl,
    );
    print("Long:$response");
    longProjectProgress = false;
    if (response != null) {
      LongProjectDataModel = LongTermModel.fromJson(response);

      update();
      return true;
    } else {
      update();
      return false;
    }
  }


}