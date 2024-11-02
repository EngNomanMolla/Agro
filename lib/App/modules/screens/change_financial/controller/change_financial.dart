import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/data/urls/urls.dart';
import 'package:smart_biniyog/App/modules/screens/cart/views/cart_screen.dart';
import 'package:smart_biniyog/App/modules/screens/profile/controller/profile_controller.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';

import '../../cart/views/checkout.dart';

class ChangeFinancialController extends GetxController {
  var loginInProgress = true.obs;

  final profileController = Get.put(ProfileController());

  Future<bool> bankingInfoChange(String bankN, String acN, String branchN,
      String acNo, String? swift, String? routing) async {
    loginInProgress.value = true;

    update();
    final data = await NetworkUtils().updateBankDetails(
      data: {
        "bank_name": bankN,
        "ac_name": acN,
        "branch_name": branchN,
        "ac_no": acNo,
        'routing_number': routing,
        'swift_code': swift,
      },
    );

    loginInProgress.value = false;

    if (data.statusCode == 200) {
      Get.snackbar('Success', 'Banking data successfully updated');

      print(profileController.type.value);

      if (profileController.type.value == 1) {
        Get.offAll(() => CartScreen(), arguments: true);
      } else if (profileController.type.value == 2) {
        Get.to(
          () => CheckoutScreen(
            type: 'book_now',
          ),
          arguments: true,
        );
      }
      return true;
    } else {
      Get.snackbar('Error', 'Something is wrong');
      return false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
