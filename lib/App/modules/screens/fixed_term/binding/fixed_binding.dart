import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'package:smart_biniyog/App/modules/screens/fixed_term/controller/fixed_term.dart';


class FixedTermBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FixedTermController());
  }
}

