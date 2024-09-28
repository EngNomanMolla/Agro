import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smart_biniyog/App/data/model/return_variable.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/data/urls/urls.dart';

class VariableTermController extends GetxController{



  @override
  void onInit() {
    getReturnTermProcect();
    super.onInit();
  }

  bool returnProjectProgress = false;
  ReturnModel ReturnProjectDataModel = ReturnModel();


  Future<bool> getReturnTermProcect() async {
    returnProjectProgress = true;
    update();
    final response = await NetworkUtils().getMethod(
      Urls.returntermprojecturl,
    );
    print(" return:$response");
    returnProjectProgress = false;
    if (response != null) {
     ReturnProjectDataModel = ReturnModel.fromJson(response);

      update();
      return true;
    } else {
      update();
      return false;
    }
  }


}