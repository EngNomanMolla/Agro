import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:smart_biniyog/App/modules/Screens/home/controller/home_controller.dart';
import 'package:smart_biniyog/App/modules/screens/project_review/controller/project_review_list_controller.dart';



class ProjectReviewListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProjectReviewListController());
    Get.lazyPut(() => HomeController());
  }
}


class ProjectReviewDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProjectReviewDetailsController());
  }
}

