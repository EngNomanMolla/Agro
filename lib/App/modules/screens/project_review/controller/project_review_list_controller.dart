import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smart_biniyog/App/data/model/allproject_nodel.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/data/urls/urls.dart';

class ProjectReviewListController extends GetxController{



  @override
  void onInit() {
    getReviewProcect();
    super.onInit();
  }


  bool reviewProjectProgress = false;
  AllProjectModel AllProjectDataModel = AllProjectModel();


  Future<bool> getReviewProcect() async {
    reviewProjectProgress = true;
    update();
    final response = await NetworkUtils().getMethod(
      Urls.allprojecturl,
    );
    print("All response:$response");
    reviewProjectProgress = false;
    if (response != null) {
      AllProjectDataModel = AllProjectModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }


}


class ProjectReviewDetailsController extends GetxController{





  // bool ProjectReviewProgress = false;
  //
  //
  // Future<dynamic> ProjectReviews(String projectId,String rating,String reviewText) async {
  //   ProjectReviewProgress = true;
  //   update();
  //   return await NetworkUtils().PostMethod(Urls.projectreviewurl,              //final result =
  //       body: {
  //         "project_id": projectId,
  //         "rating": rating,
  //         "review_text": reviewText,
  //
  //   });
  //
  //   ProjectReviewProgress = false;
  //
  // }




}
class ProjectReviewController extends GetxController{



  @override
  void onInit() {
    getReviewProcected();
    super.onInit();
  }


  bool reviewProjectProgress = false;
  AllProjectModel AllProjectDataModel = AllProjectModel();


  Future<bool> getReviewProcected() async {
    reviewProjectProgress = true;
    update();
    final response = await NetworkUtils().getMethod(
      Urls.allprojecturl,
    );
    print("All response:$response");
    reviewProjectProgress = false;
    if (response != null) {
      AllProjectDataModel = AllProjectModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }


}