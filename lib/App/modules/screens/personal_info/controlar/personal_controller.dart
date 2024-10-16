import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_biniyog/App/data/model/personInfo.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/data/urls/urls.dart';
import 'package:smart_biniyog/App/modules/utils/snackbar_message.dart';

class PersonalInfoGetController extends GetxController{

  bool personInfoProgress = false;
 PersonInfoModel personInfoDataModel = PersonInfoModel();


  Future<bool> getPersonInfo() async {
    personInfoProgress = true;
    update();
    final response = await NetworkUtils().getMethod(
      Urls.PersonInfowurl,
    );
    print("personInfo:$response");
    personInfoProgress = false;
    if (response != null) {
      personInfoDataModel = PersonInfoModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  var selected = File('').obs;

  selectPhoto () async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picked != null) {
      showSnackBarMessage(Get.context!, 'Uploading...');
      selected.value = File(picked.path);
      update();

      updateProfilePicture();
    }
  }

  updateProfilePicture () async {
    final response = await NetworkUtils().updateProfilePicture(selected.value.path);

    if (response.statusCode == 200) {
      showSnackBarMessage(Get.context!, 'Profile picture updated');
    } else {
      return showSnackBarMessage(Get.context!, 'Something is wrong!');
    }
  }



  @override
  void onInit() {
    getPersonInfo();
    super.onInit();
  }




}