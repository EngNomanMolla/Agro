import 'package:flutter/material.dart';
import 'package:smart_biniyog/App/constant/base_url.dart';
import 'package:smart_biniyog/App/data/model/my_farm_model.dart';

class CustomProjectWidget extends StatelessWidget {
  final Datum farm;

  const CustomProjectWidget({super.key, required this.farm});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: farm.projectStatus == 'Active' ? Colors.green : Colors.red,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          child: Center(
            child: Text(
              farm.projectStatus ?? '',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 4,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage('$api_base_url${farm.projectImage ?? ''}'),
                ),
                title: Text(
                  farm.projectName ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  farm.projectCategory ?? '',
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Divider(
                color: Colors.black.withOpacity(.050),
                indent: 40,
                endIndent: 40,
              ),
              buildRow(Icons.monetization_on_outlined,
                  '${farm.totalDeposit} BDT Total Deposit'),
              buildRow(Icons.access_time_filled_outlined,
                  farm.projectDuration ?? ''),
              buildRow(
                  Icons.percent, '${farm.returnMin}% - ${farm.returnMax}%'),
              const SizedBox(
                height: 5,
              ),
              DateProgress(
                startDate: farm.projectStartDate!, // Your data from the API
                expirationDate: farm.projectExpirationDate!,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Expiration Date: ${farm.projectExpirationDate!.day}/${farm.projectExpirationDate!.month}/${farm.projectExpirationDate!.year}',
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget buildRow(IconData icon, String value) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.black.withOpacity(.5),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(value)
          ],
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }


}

class DateProgress extends StatelessWidget {
  final DateTime startDate;
  final DateTime expirationDate;

  DateProgress({required this.startDate, required this.expirationDate});

  @override
  Widget build(BuildContext context) {
    // Current date
    DateTime today = DateTime.now();

    // Calculating total days and days passed
    int totalDays = expirationDate.difference(startDate).inDays;
    int daysPassed = today.difference(startDate).inDays;

    // Ensuring the percentage value stays between 0 and 1
    double progress = (daysPassed / totalDays).clamp(0.0, 1.0);
    int percentage = (progress * 100).round();

    return Row(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
          ),
        ),
        const SizedBox(width: 10),
        Text('$percentage%')
      ],
    );
  }
}


