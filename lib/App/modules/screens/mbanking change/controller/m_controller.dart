import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/data/urls/urls.dart';

class ChangeBankingController extends GetxController{

  bool loginInProgress = false;

  Future<dynamic> MbankingInfChange(String mfsName,String mfsType,String mfsNumber) async {
    //loginInProgress = true;
    update();
    return await NetworkUtils().PostMethod(
        Urls.mbankingInfoChangeurl,              //final result =
        body: {
          "mfs_name":mfsName,
          "mfs_type": mfsType,
          "mfs_number": mfsNumber,

        });

    //loginInProgress = false;

  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }




}