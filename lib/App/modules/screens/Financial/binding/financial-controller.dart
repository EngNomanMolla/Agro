import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:smart_biniyog/App/modules/screens/Financial/controller/financial_controller.dart';


class FinancialBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FinancialController());
  }
}

