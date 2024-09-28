import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smart_biniyog/App/data/model/fixedTerm.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/data/urls/urls.dart';

class FixedTermController extends GetxController{
@override
void onInit() {
  getFixedTermProcect();
  super.onInit();
}

bool fixedProjectProgress = false;
FixedModel FixedProjectDataModel = FixedModel();


Future<bool> getFixedTermProcect() async {
  fixedProjectProgress = true;
  update();
  final response = await NetworkUtils().getMethod(
    Urls.fixedtermprojecturl,
  );
  print("fixed:$response");
  fixedProjectProgress = false;
  if (response != null) {
    FixedProjectDataModel = FixedModel.fromJson(response);

    update();
    return true;
  } else {
    update();
    return false;
  }
}



}