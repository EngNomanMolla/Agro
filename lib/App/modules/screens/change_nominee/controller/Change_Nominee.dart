import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/data/urls/urls.dart';

class ChangeNomineeController extends GetxController {
  bool loginInProgress = false;

  Future<dynamic> NomineeInfChange(
    String name,
    String number,
    String nid,
    String relation,
  ) async {
    loginInProgress = true;
    update();
    return await NetworkUtils()
        .PostMethod(Urls.nomineeInfoChangeurl, //final result =
            body: {
          "name": name,
          "phone": number,
          "nid": nid,
          "relationship": relation,
        });

    loginInProgress = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
