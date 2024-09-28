import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
//import 'package:smart_biniyog/App/modules/Screens/person_info/controller/person_info_controller.dart';
import 'package:smart_biniyog/App/modules/screens/person_info_sub/controller/person_info_controller.dart';

class PersonInfoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PersonInfoController());
  }
}

