import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smart_biniyog/App/data/model/personInfo.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/data/urls/urls.dart';

class PersonalInfoGetController extends GetxController{

  bool personInfoProgress = false;
 PersonInfoModel personInfoDataModel = PersonInfoModel();


  Future<bool> getPersonInfo() async {
    personInfoProgress = true;
    update();
    final response = await NetworkUtils().getMethod(
      Urls.PersonInfowurl,
    );
    print("personInfo:$response");
    personInfoProgress = false;
    if (response != null) {
      personInfoDataModel = PersonInfoModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }



  @override
  void onInit() {
    getPersonInfo();
    super.onInit();
  }




}