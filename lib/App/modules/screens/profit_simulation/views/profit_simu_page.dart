import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_biniyog/App/data/model/project_model.dart';
import 'package:smart_biniyog/App/modules/Screens/home/controller/home_controller.dart';

class ProfitSimuScreen extends StatefulWidget {
  Projects project;
  ProfitSimuScreen(this.project) ;

  @override
  State<ProfitSimuScreen> createState() => _ProfitSimuScreenState();
}

class _ProfitSimuScreenState extends State<ProfitSimuScreen> {
  HomeController homeController=Get.find<HomeController>();

  int totalNumberOfProjects=1;
  num totalPrice=0;

  @override
  void initState() {
    totalPrice=double.parse(widget.project.projectPrice!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Table(
                  border: TableBorder.all(color: Colors.grey),
                  children: [
                    _buildTableRow('Project Duration', widget.project.duration.toString()+' Days'),
                    _buildTableRow('ROI',widget.project.returnMin.toString()+'%' +' - '+  widget.project.returnMax.toString()+'%'),
                    _buildTableRow('Net Profit', calculateROI(widget.project.returnMin, widget.project.projectPrice) +' - '+  calculateROI(widget.project.returnMax, widget.project.projectPrice)),
                    _buildTableRow('Total Cost',(totalPrice*totalNumberOfProjects).toString())
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(

                  children: [
                    Expanded(
                        flex: 4,
                        child: Row(

                            children: [
                          InkWell(
                            onTap: (){
                              if(totalNumberOfProjects>1){
                                setState(() {
                                  totalNumberOfProjects--;
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.remove,color: Colors.white),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(totalNumberOfProjects.toString(),style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                          ),

                          InkWell(
                            onTap: (){
                              setState(() {
                                totalNumberOfProjects++;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.add,color: Colors.white),
                            ),
                          )


                        ])),

                    Expanded(
                        flex: 5,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Color(0xff38b579),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text('Add to Cart',style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            )),
                          ),
                        ))
                  ]
                ),
              )

            ],
          )),
    );
  }


  String calculateROI(percentage,totalPrice){

    double roi = ((double.parse(percentage)/100) * double.parse(totalPrice)) / double.parse(totalPrice);

    return '৳ '+ roi.toStringAsFixed(2);
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
