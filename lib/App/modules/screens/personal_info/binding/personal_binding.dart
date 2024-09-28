import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:smart_biniyog/App/modules/screens/personal_info/controlar/personal_controller.dart';

class PersonalBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalInfoGetController());
  }
}

