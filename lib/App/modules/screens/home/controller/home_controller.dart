import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smart_biniyog/App/data/model/blog_model.dart';
import 'package:smart_biniyog/App/data/model/catagory_model.dart';
import 'package:smart_biniyog/App/data/model/allproject_nodel.dart';
import 'package:smart_biniyog/App/data/model/project_model.dart';
import 'package:smart_biniyog/App/data/model/project_type_model.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/data/urls/urls.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  bool getCategoryProgress = false;
  List<CategoryModel> categories = [];

  RxInt currentIndex = 0.obs;

  List<ProjectModel> projects = [];

  List<String> sliderImages = [];

  BlogModel? blogModel;

  NetworkUtils networkUtils = new NetworkUtils();

  @override
  void onInit() {
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging &&
          currentIndex.value != tabController.index) {
        // Ensure we only make the API call when the tab change is finalized
        currentIndex.value = tabController.index;
        print(currentIndex.value);
        // fetchProjects(tabController.index);  // Call API when the index changes
      }
    });

     getAllSliderImages();
    //getProjectType();
    //getReviewProcect();
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void getAllSliderImages() async {
    try {
      getCategoryProgress = true;
      update();
      http.Response response = await networkUtils.getAllSliderImages();
      if (response.statusCode == 200) {
        // Decode the entire response body as JSON
        var data = jsonDecode(response.body);

        // Assuming 'projects' is a list and you're adding ProjectModel items
        for (var slider in data['data']) {
          sliderImages.add(slider['image']);
        }

        print(sliderImages);  // To verify the data being added
        getCategory();
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  Future<bool> getCategory() async {

    final response = await NetworkUtils().getMethod(
      Urls.categoryUrl,
    );
    if (response != null) {
      var data = response['data'];

      for (int i = 0; i < data.length; i++) {
        categories.add(CategoryModel.fromJson(data[i]));
      }
      //getCategoryProgress=false;
      getProjectByProjectType();

      return true;
    } else {
      update();
      return false;
    }
  }

  void getProjectByProjectType() async {
    try {
      http.Response response = await networkUtils.getProjectsByBusinessType();
      if (response.statusCode == 200) {
        // Decode the entire response body as JSON
        var data = jsonDecode(response.body);

        // Assuming 'projects' is a list and you're adding ProjectModel items
        for (var projectType in data) {
            projects.add(ProjectModel.fromJson(projectType));
        }

        getAllBlog();
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void getAllBlog()async{

    try {
      http.Response response = await networkUtils.getAllBlog();
      if (response.statusCode == 200) {

        var data = jsonDecode(response.body);

        blogModel=BlogModel.fromJson(data);
        getCategoryProgress = false;
        update();
      }
    } catch (e) {
      print('Error: $e');
    }

  }


  bool ProjectTypeProgress = false;
  ProjectTypeModel projectTypeDataModel = ProjectTypeModel();

  Future<bool> getProjectType() async {
    ProjectTypeProgress = true;
    update();
    final response = await NetworkUtils().getMethod(
      Urls.businesstypeurl,
    );
    //print("response:$response");
    ProjectTypeProgress = false;
    if (response != null) {
      projectTypeDataModel = ProjectTypeModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  bool reviewProjectProgress = false;
  AllProjectModel allProjectDataModel = AllProjectModel();

  Future<bool> getReviewProcect() async {
    reviewProjectProgress = true;
    update();
    final response = await NetworkUtils().getMethod(
      Urls.allprojecturl,
    );
    // print("All response:$response");
    reviewProjectProgress = false;
    if (response != null) {
      allProjectDataModel = AllProjectModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}

//
//
//   final response = await NetworkUtils.getMethod(categoryUrl);
//   _getCategoryInProgress = false;
//   if (response.isSuccess) {
//     _categoryModel = Category.fromJson(response.returnData);
//     update();
//     return true;
//   } else {
//     update();
//     return false;
//   }
// }
//
//
// }
