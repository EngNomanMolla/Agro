import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:smart_biniyog/App/modules/Screens/home/controller/home_controller.dart';
import 'package:smart_biniyog/App/modules/Screens/mycard/controller/mycard_controller.dart';
import 'package:smart_biniyog/App/modules/screens/change_person_Info/controller/changeper-controller.dart';

class ChangePerInfoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePerInfoController());
  }
}

