import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smart_biniyog/App/data/model/personInfo.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/data/urls/urls.dart';

class FinancialController extends GetxController{


  @override
  void onInit() {
    GetPersonInfoModel();
    super.onInit();
  }


  bool getpersonInfoProgress = false;
  PersonInfoModel bankingInfoDataModel = PersonInfoModel();


  Future<bool> GetPersonInfoModel() async {
    getpersonInfoProgress = true;
    update();
    final response = await NetworkUtils().getMethod(
      Urls.PersonInfowurl,

    );
    //print('user:$response');
    getpersonInfoProgress = false;
    if (response != null) {
      //final Map<String, dynamic> jsonData = json.decode(response.body);
      bankingInfoDataModel = PersonInfoModel.fromJson(response);

      //client = Client.fromJson(jsonData['client']);

      update();


      return true;
    } else {
      update();
      return false;
    }
  }




}