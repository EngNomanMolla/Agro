import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_biniyog/App/modules/utils/snackbar_message.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';
import '../../../../data/model/personInfo.dart';
import '../../../../data/service/network_caller.dart';
import '../../../../data/urls/urls.dart';

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

  RxBool personInfoProgress = false.obs;
  PersonInfoModel personInfoDataModel = PersonInfoModel();
  final amount = TextEditingController();

  Future<bool> getPersonInfo() async {
    personInfoProgress.value = true;
    update();
    final response = await NetworkUtils().getMethod(
      Urls.PersonInfowurl,
    );
    print("personInfo:$response");
    personInfoProgress.value = false;
    if (response != null) {
      personInfoDataModel = PersonInfoModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  RxBool isInsufficientBalance = RxBool(false);
  RxBool isLoading = RxBool(false);


  void submitWithdraw () async {
    if (amount.text.isEmpty) {
      showSnackBarMessage(Get.context!, 'Please enter a amount.');
      return;
    }

    if (selected == null) {
      showSnackBarMessage(Get.context!, 'Please select a withdraw method.');
      return;
    }

    final withdrawAble = int.parse(personInfoDataModel.client!.allBalance!.restBalance.toString());
    final entered = int.parse(amount.text.toString());
    if (withdrawAble < entered) {
      showSnackBarMessage(Get.context!, 'You do not have sufficient balance to withdraw.');
      return;
    }

    isLoading.value = true;

    final response = await NetworkUtils().submitWithdraw(data: {
      'payment_method' : selected == 1 ? 'bank' : 'mfs',
      'amount' : amount.text.toString(),
      'note' : 'Withdraw Submit...',
    });

    isLoading.value = false;

    print(response.body);

    if (response.statusCode == 200) {
      Get.offAllNamed(RouteNames.mainNavigationScreen);
      showSnackBarMessage(Get.context!, 'Withdraw request successfully submitted');
      return;
    } else {
      showSnackBarMessage(Get.context!, 'Something is wrong, try again!');
    }
  }

  @override
  void onInit() {
    getPersonInfo();
    super.onInit();
  }

}