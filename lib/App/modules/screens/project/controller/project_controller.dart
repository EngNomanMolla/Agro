import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:smart_biniyog/App/data/model/project_model.dart';
import 'package:smart_biniyog/App/data/model/new_project_model.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';

class ProjectController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  RxInt currentIndex = 0.obs;


  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging &&
          currentIndex.value != tabController.index) {
        // Ensure we only make the API call when the tab change is finalized
        currentIndex.value = tabController.index;
        print(currentIndex.value);
        getProjects();
        // fetchProjects(tabController.index);  // Call API when the index changes
      }
    });

    getProjects();
  }

  RxList<NewProjectModel> projects = <NewProjectModel>[].obs;
  RxBool isLoading = RxBool(false);


  void getProjects () async {

    isLoading.value = true;

    final response = await NetworkUtils().getProjects(categoryID: currentIndex.value == 0 ? null : currentIndex.value.toString());

    print(response.body);
    isLoading.value = false;

    final decoded = jsonDecode(response.body)['data'];

    projects.value = newProjectModelFromJson(jsonEncode(decoded));

    update();
  }
}
