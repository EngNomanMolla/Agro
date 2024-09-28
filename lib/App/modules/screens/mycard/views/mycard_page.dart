import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_biniyog/App/modules/Screens/mycard/controller/mycard_controller.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppElevatedButtonWidget.dart';
import 'package:smart_biniyog/App/modules/Widgets/ProductCalculatStepper.dart';
import 'package:smart_biniyog/App/modules/screens/project_review/controller/project_review_list_controller.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';


class MyCardScreen extends GetView<MyCardController> {
   MyCardScreen({Key? key}) : super(key: key);

  ButtonStyle buttonStyle=ElevatedButton.styleFrom(
      padding: EdgeInsets.all(25),
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40))
      )
  );

  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  MyAlertDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
              child: AlertDialog(
                title: ListTile(

                  trailing: IconButton(onPressed: () {  Navigator.of(context).pop(); },icon: Icon( Icons.clear_rounded,)),
                ),
                content: Text(" "),
                actions: [
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.person,size: 80,),
                        SizedBox(height: 15,),

                        Text('Need to complete Profile',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                        SizedBox(height: 15,),
                        AppElevatedButton(
                          Color: Colors.green,

                          onTap: () {
                            Get.toNamed(RouteNames.personInfoScreen);

                          },
                          child: Center(
                            child: Text(
                              "Give Information",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  //fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ));
        });
  }
   ProjectReviewListController projectReviewListController=Get.put(ProjectReviewListController());
  @override
  Widget build(BuildContext context) {
    // final Map<String, String> arguments = Get.arguments;
    // print(arguments['id']);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('My Cart')),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 30,
                    child: Container(

                      child: Image.asset(
                        'assets/images/Cowmarket.jpeg',
                        fit: BoxFit.fill,
                        height:70,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 35,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text(
                            'Cattle Trade-15',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child:  Text(
                            '25,000 BDT',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),



                      ],
                    ),
                  ),
                  Expanded(
                    flex: 40,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: ProductStepper(
                        onDecrement: (int currentValue) {  },
                        onIncrement: (int currentValue) {  },),
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
            Divider(
              color: Colors.grey,
              // height: 10,
              thickness: 2,
              // indent: 20,
              // endIndent: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 30,
                    child: Container(

                      child: Image.asset(
                        'assets/images/Cowmarket.jpeg',
                        fit: BoxFit.fill,
                        height:70,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 35,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text(
                            'Cattle Trade-15',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child:  Text(
                            '25,000 BDT',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),



                      ],
                    ),
                  ),
                  Expanded(
                    flex: 40,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: ProductStepper(
                        onDecrement: (int currentValue) {  },
                        onIncrement: (int currentValue) {  },),
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
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 30,
                    child: Container(

                      child: Image.asset(
                        'assets/images/Cowmarket.jpeg',
                        fit: BoxFit.fill,
                        height:70,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 35,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text(
                            'Cattle Trade-15',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child:  Text(
                            '25,000 BDT',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),



                      ],
                    ),
                  ),
                  Expanded(
                    flex: 40,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: ProductStepper(
                        onDecrement: (int currentValue) {  },
                        onIncrement: (int currentValue) {  },),
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
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 30,
                    child: Container(

                      child: Image.asset(
                        'assets/images/Cowmarket.jpeg',
                        fit: BoxFit.fill,
                        height:70,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 35,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text(
                            'Cattle Trade-15',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child:  Text(
                            '25,000 BDT',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),



                      ],
                    ),
                  ),
                  Expanded(
                    flex: 40,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: ProductStepper(
                        onDecrement: (int currentValue) {  },
                        onIncrement: (int currentValue) {  },),
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
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: double.infinity,
                  color: Colors.green[50],
                  height: 60,

                  child: const ListTile(
                   trailing: Text('45,000 BDT',
                  style: TextStyle(
                    fontSize: 15,

                  ),

                   ),
                    title: Text('Total',
                      style: TextStyle(
                        fontSize: 15,

                      ),),



                  )),
            ),
            TextButton(
              style:TextButton.styleFrom(
                  side: BorderSide(color: Colors.red),
                  foregroundColor: Colors.green,
                 padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)



                  ),
                  elevation: 5

              ),
              onPressed: () {

                Get.toNamed(RouteNames.projectScreen);
              },
              child: Text('+ Add More Project',
              style: TextStyle(fontSize: 15),
              ),
            ),

            SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppElevatedButton(
Color: Colors.green,
                onTap: () {
                 // MyAlertDialog(context);
                  Get.toNamed(RouteNames.personInfoScreen);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => Personal_infoScreen()));
                },
              child: Text('CheckOut',
              style: TextStyle(
                fontSize: 15,
     color: Colors.white
              ),

              ),),
            ),

          ],
      ),
        ),),

      floatingActionButtonLocation:FloatingActionButtonLocation.endFloat,

      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.phone) ,
        backgroundColor: Colors.green,
        onPressed: (){

        },
      ),
    );
  }
}
