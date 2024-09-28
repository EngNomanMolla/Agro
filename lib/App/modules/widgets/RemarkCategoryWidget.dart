import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemarkCategoryWidget extends StatelessWidget {
  const RemarkCategoryWidget({
    super.key,
    required this.RemarkName,
    required this.icon, required this.onTap,
  });
  final String RemarkName;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: Card(
        child: Container(
          height: 90,
          width: 120,
          decoration: BoxDecoration(
              color: Color(0xff38b579), borderRadius: BorderRadius.circular(8)),
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon,color: Colors.white),
                  SizedBox(height: 5.0),
                  Text(
                    RemarkName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}