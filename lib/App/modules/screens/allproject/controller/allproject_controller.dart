import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smart_biniyog/App/data/model/allproject_nodel.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/data/urls/urls.dart';
// import 'package:http/http.dart' as http;
//
class AllProjectController extends GetxController{

  @override
  void onInit() {
    getAllProcect();
    super.onInit();

  }

  bool allProjectProgress = false;
  AllProjectModel AllProjectDataModel = AllProjectModel();


  Future<bool> getAllProcect() async {
    allProjectProgress = true;
    update();
    final response = await NetworkUtils().getMethod(
      Urls.allprojecturl,
    );
   // print("All response:$response");
    allProjectProgress = false;
    if (response != null) {
      AllProjectDataModel = AllProjectModel.fromJson(response);
      //print(AllProjectDataModel);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }




}