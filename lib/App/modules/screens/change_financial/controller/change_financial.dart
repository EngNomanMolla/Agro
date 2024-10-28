import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/data/urls/urls.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';

class ChangeFinancialController extends GetxController {

  var loginInProgress = true.obs;

  Future<bool> bankingInfoChange(String bankN, String acN, String branchN,
      String acNo, String? swift, String? routing) async {
    loginInProgress.value = true;

    update();
    final data = await NetworkUtils().updateBankDetails(data: {
      "bank_name": bankN,
      "ac_name": acN,
      "branch_name": branchN,
      "ac_no": acNo,
      'routing_number' : routing,
      'swift_code' : swift,
    },);


    loginInProgress.value = false;

    if (data.statusCode == 200) {
      Get.offAllNamed(RouteNames.mainNavigationScreen);
      Get.snackbar('Success', 'Banking data successfully updated');
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