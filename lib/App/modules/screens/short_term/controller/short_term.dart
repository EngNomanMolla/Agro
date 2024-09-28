
import 'package:get/get.dart';
import 'package:smart_biniyog/App/data/model/short_term.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/data/urls/urls.dart';

class ShortTermController extends GetxController{




  @override
  void onInit() {
    getShortTermProcect();
    super.onInit();
  }

  bool shortProjectProgress = false;
  ShortModel ShortProjectDataModel = ShortModel();


  Future<bool> getShortTermProcect() async {
    shortProjectProgress = true;
    update();
    final response = await NetworkUtils().getMethod(
      Urls.shorttermprojecturl,
    );
    print("short_response:$response");
    shortProjectProgress = false;
    if (response != null) {
      ShortProjectDataModel = ShortModel.fromJson(response);

      update();
      return true;
    } else {
      update();
      return false;
    }
  }



}