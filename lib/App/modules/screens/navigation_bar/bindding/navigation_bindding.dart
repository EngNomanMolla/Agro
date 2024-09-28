import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smart_biniyog/App/modules/Screens/home/controller/home_controller.dart';
import 'package:smart_biniyog/App/modules/Screens/navigation_bar/controller/navigaion_controller.dart';
import 'package:smart_biniyog/App/modules/screens/allproject/controller/allproject_controller.dart';
import 'package:smart_biniyog/App/modules/screens/project/controller/project_controller.dart';

class NavigaionBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NavigatinController());
    Get.lazyPut(() => HomeController());

  }




}

