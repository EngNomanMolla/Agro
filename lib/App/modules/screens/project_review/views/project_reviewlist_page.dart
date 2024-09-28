import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppElevatedButtonWidget.dart';
import 'package:smart_biniyog/App/modules/screens/project_review/controller/project_review_list_controller.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';

class ProjectReviewList extends GetView<ProjectReviewList> {
  const ProjectReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Our Best Project')),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<ProjectReviewListController>(builder: (ProjectReviewListController) {
          return ProjectReviewListController.reviewProjectProgress
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : RefreshIndicator(
            onRefresh: () async {
              ProjectReviewListController.getReviewProcect();
            },
            child: Column(
              children: ProjectReviewListController.AllProjectDataModel.data!
                  .map((e) =>  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 30,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                              'assets/images/Agriculture.jpg',
                              fit: BoxFit.fill,
                              //height: 100,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 75,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                'Cattle Trade-15',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    '25,000 BDT/Unit',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),






                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AppElevatedButton(
                                Color: Colors.green,
                                onTap: () {
                                  Get.toNamed(RouteNames.myCardScreen,
                                      arguments: {
                                        'id':e.id!.toString(),
                                      }

                                  );

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) => Personal_infoScreen()));
                                },
                                child: Text('Book',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white
                                  ),

                                ),),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),





              )
                  .toList(),
            ),
          );
        }),
      ),




    );
  }
}
