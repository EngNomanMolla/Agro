import 'package:flutter/material.dart';

class CustomProjectWidget extends StatelessWidget {
  final int index;
  const CustomProjectWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: index == 1 ? Colors.red : Colors.green,
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
              index == 1 ? 'Terminated' : 'Active',
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
                ),
                title: Text(
                  'Burton Cook',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Short Term',
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
              buildRow(Icons.monetization_on_outlined, '1000 BDT/Unit'),
              buildRow(Icons.access_time_filled_outlined, '5 Months'),
              buildRow(Icons.percent, '10% - 15%'),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                      child: LinearProgressIndicator(
                    value: 0.95,
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('95%')
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Expiration Date: 10/20/2024',
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
