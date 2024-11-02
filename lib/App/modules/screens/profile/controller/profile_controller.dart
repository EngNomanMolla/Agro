import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with GetSingleTickerProviderStateMixin {

  late TabController tabController;

  RxInt type = RxInt(0); // 0 = normal, 1 = cart, 2 = checkout

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this);
  }




}