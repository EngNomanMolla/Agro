import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'package:smart_biniyog/App/modules/Screens/more_page/controller/more_controller.dart';

class MoreBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MoreController());
  }
}

