import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_biniyog/App/modules/Screens/home/controller/home_controller.dart';

class AllProjectScreen extends StatelessWidget {
  const AllProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              height: 105.0,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset('assets/images/imagesagr.jpeg',
                              fit: BoxFit.cover))),
                  SizedBox(width: 10.0),
                  Expanded(
                    flex: 4,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Burton Cook',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis)),
                          Row(children: [
                            Text('10000',
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
                            Text('10%-15%',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.black54)),
                          ]),
                          Row(children: [
                            Icon(Icons.timelapse_rounded,
                                color: Colors.black54, size: 18.0),
                            SizedBox(width: 5.0),
                            Text('3 Months',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.black54)),
                          ])
                        ]),
                  )
                ],
              ),
            );
          });
    });
  }
}
