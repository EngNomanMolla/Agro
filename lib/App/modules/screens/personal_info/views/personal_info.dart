import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_biniyog/App/modules/screens/change_person_Info/views/change_info.dart';
import 'package:smart_biniyog/App/modules/screens/personal_info/controlar/personal_controller.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';

class PersonalInfoScreen extends GetView<PersonalInfoGetController> {
  PersonalInfoScreen({Key? key}) : super(key: key);
  PersonalInfoGetController personalInfoGetController =
      Get.put(PersonalInfoGetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PersonalInfoGetController>(
          builder: (PersonalInfoGetController) {
        return PersonalInfoGetController.personInfoProgress
            ? const Center(
                child: CircularProgressIndicator(color: Color(0xff38b579)),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 15.0),
                    Container(
                        decoration: BoxDecoration(
                            color: Color(0xff38b579).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(100)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.person, size: 100.0),
                        )),
                    SizedBox(height: 15.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff38b579).withOpacity(0.2),
                      ),
                      child: ListTile(
                        title: Text(
                          'Personal Informaion',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: TextButton(
                          onPressed: () {
                            Get.toNamed(RouteNames.changePersonalInfo, arguments: PersonalInfoGetController.personInfoDataModel);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff38b579),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0,
                                    right: 12.0,
                                    top: 6.0,
                                    bottom: 6.0),
                                child: Text('Change',
                                    style: TextStyle(color: Colors.white)),
                              )),
                        ),
                      ),
                    ),
                    ListTile(
                      iconColor: Colors.black,
                      trailing: Text(
                        'Individual User',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      title: Text(
                        'I am an: ',
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
                        ' ${PersonalInfoGetController.personInfoDataModel.client!.name}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      title: Text(
                        'Name: ',
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
                        ' ${PersonalInfoGetController.personInfoDataModel.client!.email}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      title: Text(
                        'Email: ',
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
                        ' 05-05-1999',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      title: Text(
                        'Date of Birth: ',
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
                        ' ${PersonalInfoGetController.personInfoDataModel.client!.nid}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      title: Text(
                        'NID: ',
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
                        ' ${PersonalInfoGetController.personInfoDataModel.client!.gender}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      title: Text(
                        'Gender: ',
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
                        ' ${PersonalInfoGetController.personInfoDataModel.client!.tin}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      title: Text(
                        'TIN: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
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
