import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemarkBestProjrctWidget extends StatelessWidget {
  const RemarkBestProjrctWidget({
    super.key,
    required this.RemarkName,
    required this.child, required this.onTap, required this.BadgRemarkName,
  });
  final String RemarkName;
  final String BadgRemarkName;
  final Widget child;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        height: 140,
        width: 130,
        decoration: BoxDecoration(
            color: Colors.green[100], borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(4.00),
                  child: child,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  RemarkName,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                Text(
                  BadgRemarkName,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}