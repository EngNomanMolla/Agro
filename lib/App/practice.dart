import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting dates


class DateDifferenceScreen extends StatefulWidget {
  @override
  _DateDifferenceScreenState createState() => _DateDifferenceScreenState();
}

class _DateDifferenceScreenState extends State<DateDifferenceScreen> {
  DateTime? startDate;
  DateTime? endDate;
  int? differenceInDays;

  // Function to pick a date
  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isStartDate ? startDate : endDate)) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
        // Calculate the difference if both dates are selected
        if (startDate != null && endDate != null) {
          differenceInDays = endDate!.difference(startDate!).inDays;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Difference Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Start Date Button
            TextButton(
              onPressed: () => _selectDate(context, true),
              child: Text(startDate != null
                  ? 'Start Date: ${DateFormat('yyyy-MM-dd').format(startDate!)}'
                  : 'Select Start Date'),
            ),
            // End Date Button
            TextButton(
              onPressed: () => _selectDate(context, false),
              child: Text(endDate != null
                  ? 'End Date: ${DateFormat('yyyy-MM-dd').format(endDate!)}'
                  : 'Select End Date'),
            ),
            SizedBox(height: 20),
            // Show the difference in days
            differenceInDays != null
                ? Text('Difference: $differenceInDays days',
                style: TextStyle(fontSize: 18))
                : Text('Select both dates to see the difference.',
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
