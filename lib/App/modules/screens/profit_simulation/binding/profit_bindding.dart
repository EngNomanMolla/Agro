import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:smart_biniyog/App/modules/Screens/profit_simulation/controller/profit_controller.dart';

class ProfitSimuBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProfitSimuController());
  }
}

