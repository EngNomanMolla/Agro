import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_biniyog/App/data/model/catagory_model.dart';
import 'package:smart_biniyog/App/modules/Screens/home/controller/home_controller.dart';
import 'package:smart_biniyog/App/modules/screens/project/views/components/projects_section_widget.dart';

import '../controller/project_controller.dart';

class ProjectPageScreen extends StatefulWidget {
  bool leading;

  ProjectPageScreen(this.leading);

  @override
  State<ProjectPageScreen> createState() => _ProjectPageScreenState();
}

class _ProjectPageScreenState extends State<ProjectPageScreen> {
  HomeController homeController = Get.put(HomeController());
  ProjectController projectController = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(name: 'All', id: 0),
    ];

    categories.addAll(homeController.categories);

    return Scaffold(
      appBar: AppBar(
        leading: widget.leading
            ? InkWell(
                onTap: () => Get.back(),
                child: Icon(Icons.arrow_back_ios, color: Colors.white))
            : SizedBox(),
        title: Text('Projects', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff38b579), // Base color
        bottom: TabBar(
          controller: projectController.tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          isScrollable: true,
          labelStyle: TextStyle(fontSize: 16.0),
          tabs: categories
              .map((category) => Tab(
                    text: category.name!,
                  ))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: projectController.tabController,
        children: categories.map((tab) {
          return ProjectsSectionWidget();
        }).toList(),
      ),
    );
  }
}
