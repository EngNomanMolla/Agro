import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppElevatedButtonWidget.dart';
import 'package:smart_biniyog/App/modules/screens/best_project/controller/best_project_controller.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';


class BestProjectScreen extends GetView<BestProjectController> {
  const BestProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Our Best Project')),
      ),
      body: Column(
        children: [
          Divider(
            color: Colors.grey,
            // height: 10,
            thickness: 2,
            // indent: 20,
            // endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
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
                        'assets/images/Cowmarket.jpeg',
                        fit: BoxFit.fill,
                        height: 100,
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
                            //MyAlertDialog(context);
                            Get.toNamed(RouteNames.projectScreen);
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
          ),
          Divider(
            color: Colors.grey,
            // height: 10,
            thickness: 2,
            // indent: 20,
            // endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
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
                            //MyAlertDialog(context);
                            Get.toNamed(RouteNames.projectScreen);
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
          ),
          Divider(
            color: Colors.grey,
            // height: 10,
            thickness: 2,
            // indent: 20,
            // endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
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
                            //MyAlertDialog(context);
                            Get.toNamed(RouteNames.projectScreen);
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
          ),
          Divider(
            color: Colors.grey,
            // height: 10,
            thickness: 2,
            // indent: 20,
            // endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
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
                        'assets/images/Cowmarket.jpeg',
                        fit: BoxFit.fill,
                        height: 100,
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
                            //MyAlertDialog(context);
                            Get.toNamed(RouteNames.projectScreen);
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
          ),





        ],
      ),
    );
  }
}
