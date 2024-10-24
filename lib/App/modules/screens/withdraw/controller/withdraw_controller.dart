import 'package:get/get.dart';

class WithdrawController extends GetxController {
  RxInt? selected;

  changeIndex (int index) {
    if (selected == null) {
      selected = RxInt(index);
      update();
    } else {
      selected!.value = index;
      update();
    }
  }
}