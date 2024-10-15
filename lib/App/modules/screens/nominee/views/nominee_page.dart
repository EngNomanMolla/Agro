import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_biniyog/App/modules/screens/change_nominee/views/change_nominee.dart';
import 'package:smart_biniyog/App/modules/screens/nominee/controller/nominee_controller.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';

class NomineeScreen extends GetView<NomineeController> {
  NomineeScreen({Key? key}) : super(key: key);

  NomineeController nomineeController = Get.put(NomineeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NomineeController>(builder: (NomineeController) {
        return NomineeController.getpersonInfoProgress
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  NomineeController.GetNomineeInfoModel();
                },
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Nominee Informaion',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: TextButton(
                        onPressed: () {
                          Get.toNamed(RouteNames.changeNomineeInfo, arguments: NomineeController.personInfoDataModel);
                        },
                        child: Text('Change'),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        // height: 310,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            ListTile(
                              iconColor: Colors.black,
                              trailing: Text(
                                ' ${NomineeController.personInfoDataModel.client!.nominee?.name}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              title: Text(
                                'Name ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            ListTile(
                              iconColor: Colors.black,
                              trailing: Text(
                                '${NomineeController.personInfoDataModel.client!.nominee?.phone}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              title: Text(
                                'Phone ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            ListTile(
                              iconColor: Colors.black,
                              trailing: Text(
                                '${NomineeController.personInfoDataModel.client!.nominee?.nid}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              title: Text(
                                'NID ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            ListTile(
                              iconColor: Colors.black,
                              trailing: Text(
                                '${NomineeController.personInfoDataModel.client!.nominee?.relationship}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              title: Text(
                                'Relationship',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
