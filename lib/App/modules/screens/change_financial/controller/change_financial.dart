import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/data/urls/urls.dart';

class ChangeFinancialController extends GetxController{

  Future<dynamic> bankingInfoChange(String bankN,String acN,String branchN,String acNo) async {
    //loginInProgress = true;
    update();
    return await NetworkUtils().PostMethod(
        Urls.bankingInfoChangeurl,              //final result =
        body: {

          "bank_name": bankN,
          "ac_name": acN,
          "branch_name": branchN,
          "ac_no": acNo,

        });

    //loginInProgress = false;

  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }




}