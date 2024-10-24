import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/data/urls/urls.dart';

import '../../../../routes/route_names.dart';

class ChangeBankingController extends GetxController{

  Future<bool> mfsInfoChange(String mfsName, String mfsType, String mfsNumber) async {

    update();
    final data = await NetworkUtils().updateMFS(data: {
      "mfs_name":mfsName,
      "mfs_type": mfsType,
      "mfs_number": mfsNumber,
    },);

    if (data.statusCode == 200) {
      Get.offAllNamed(RouteNames.mainNavigationScreen);
      Get.snackbar('Success', 'MFS data successfully updated');
      return true;
    } else {
      Get.snackbar('Error', 'Something is wrong');
      return false;
    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }




}