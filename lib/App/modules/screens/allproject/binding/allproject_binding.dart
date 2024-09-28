import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:smart_biniyog/App/modules/screens/allproject/controller/allproject_controller.dart';
import 'package:smart_biniyog/App/modules/screens/short_term/views/shor_term-page.dart';



class AllProjectBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AllProjectController());


  }
}

