import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:smart_biniyog/App/modules/screens/best_project/controller/best_project_controller.dart';


class BestProjectBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BestProjectController());
  }
}

