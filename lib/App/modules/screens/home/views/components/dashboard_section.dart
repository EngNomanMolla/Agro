import 'package:flutter/material.dart';
import 'package:smart_biniyog/App/data/model/dashboard_model.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';

class DashboardSection extends StatefulWidget {
  const DashboardSection({super.key});

  @override
  State<DashboardSection> createState() => _DashboardSectionState();
}

class _DashboardSectionState extends State<DashboardSection> {

  String formatNumber(String value) {
    // Convert the string to a double
    double number = double.parse(value);

    // Remove decimals if the number is whole, otherwise keep the fractional part
    return number % 1 == 0 ? number.toInt().toString() : number.toString();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DashboardModel>(
      future: NetworkUtils().getDashboardData(),
      builder: (_, snap) {

        if (snap.connectionState == ConnectionState.waiting) {
          return DashboardDataWidget();
        }

        return DashboardDataWidget(
          disbursed: formatNumber(snap.data!.data!.fundDisbursed.toString()),
          projects: formatNumber(snap.data!.data!.totalProject.toString()),
          investor: formatNumber(snap.data!.data!.totalInvestor.toString()),
          returnReimbursed: formatNumber(snap.data!.data!.returnReimbursed.toString()),
        );
      },
    );
  }
}

class DashboardDataWidget extends StatelessWidget {
  final String? disbursed, projects, investor, returnReimbursed;

  const DashboardDataWidget({
    super.key,
    this.disbursed,
    this.projects,
    this.investor,
    this.returnReimbursed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 10, 8, 0),
      child: Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.all(20.0),
            height: 230,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.home_work,
                      color: Color(0xff38b579),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '৳',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff38b579)),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            '${disbursed ?? '...'} +',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                    Text(
                      'Funds Disbursed',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Icon(
                      Icons.people,
                      color: Color(0xff38b579),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${projects ?? '...'} +',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                    Text(
                      'Total Project',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.hail_outlined,
                      color: Color(0xff38b579),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '৳',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff38b579)),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            '${returnReimbursed ?? '...'} +',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                    Text(
                      'Return Reimbursed',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Icon(
                      Icons.money,
                      color: Color(0xff38b579),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${investor ?? '...'} +',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                    Text(
                      'Total Investor',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                )),
              ],
            )),
      ),
    );
  }
}
