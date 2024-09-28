import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_biniyog/App/data/model/project_model.dart';
import 'package:smart_biniyog/App/modules/Screens/home/controller/home_controller.dart';

class SummaryScreen extends StatefulWidget {
   Projects project;
   SummaryScreen(this.project) ;

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {

  HomeController homeController=Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<HomeController>(
          builder: (_) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 10.0, right: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black.withOpacity(0.8),
                    ),
                    height: 40,
                    child: Center(
                      child: Text(
                        widget.project.name!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Table(
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      _buildTableRow('Category Name', widget.project.categoryName!),
                      _buildTableRow('Investment Time', widget.project.investmentTime!+' Days'),
                      _buildTableRow('Investment Goal', '৳ '+widget.project.investmentGoal.toString()),
                      _buildTableRow('Raise', '৳ '+widget.project.raise.toString()),
                      _buildTableRow('In Waiting', '৳ '+widget.project.inWaiting.toString()),
                      _buildTableRow('Project Duration', widget.project.duration.toString()+' Days'),
                      _buildTableRow('Min Investment', '৳ '+widget.project.minInvestment.toString()),
                      _buildTableRow('ROI','৳ '+widget.project.returnMin.toString() +' - '+ '৳ '+ widget.project.returnMax.toString()),
                      _buildTableRow('Project Status', widget.project.statusName.toString()),
                      _buildTableRow('Location', widget.project.place.toString()),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
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
