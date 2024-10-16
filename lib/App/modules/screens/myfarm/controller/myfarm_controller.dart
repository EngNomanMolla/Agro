import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';

import '../../../../data/model/my_farm_model.dart';

class MyFarmController extends GetxController{



  @override
  void onInit() {
    super.onInit();
    getMyFarmData();
  }

  var myFarm = MyFarmModel().obs;

  RxBool isLoading = RxBool(false);

  getMyFarmData () async {
    isLoading.value = true;

    final response = await NetworkUtils().getMyFarm();

    myFarm.value = myFarmModelFromJson(response.body);

    print(response.body);

    isLoading.value = false;

    update();
  }



}