import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_biniyog/App/constant/base_url.dart';
import 'package:smart_biniyog/App/data/model/project_model.dart';
import 'package:smart_biniyog/App/modules/Screens/project_details/views/project_details_page.dart';
import 'package:smart_biniyog/App/modules/screens/project/controller/project_controller.dart';

class ProjectsSectionWidget extends StatelessWidget {
  const ProjectsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProjectController());

    return Obx(() => controller.isLoading.value
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: controller.projects.length,
            itemBuilder: (context, index) {
              final data = controller.projects[index];

              final productJson = jsonEncode(data);

              return InkWell(
                onTap: () {
                  final project = Projects.fromJson(jsonDecode(productJson));

                  Get.to(() => ProjectDetailScreen(project));
                },
                child: Container(
                  height: 105.0,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                  '${api_base_url}${data.image!}',
                                  fit: BoxFit.cover))),
                      SizedBox(width: 10.0),
                      Expanded(
                        flex: 4,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.name ?? '',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis)),
                              Row(children: [
                                Text(data.projectPrice ?? '',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54)),
                                SizedBox(width: 5.0),
                                Text('BDT/Unit',
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.black54)),
                              ]),
                              Row(children: [
                                Icon(Icons.monetization_on_outlined,
                                    color: Colors.black54, size: 18.0),
                                SizedBox(width: 5.0),
                                Text(
                                    '${double.parse(data.returnMin ?? '0.00').toStringAsFixed(0)}%-${double.parse(data.returnMax ?? '0.00').toStringAsFixed(0)}%',
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.black54)),
                              ]),
                              Row(children: [
                                Icon(Icons.timelapse_rounded,
                                    color: Colors.black54, size: 18.0),
                                SizedBox(width: 5.0),
                                Text('${data.duration} Months',
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.black54)),
                              ])
                            ]),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
