import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.Color,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onTap;
  final Color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              // side: BorderSide(color: Colors.red),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              backgroundColor: Color,
             ),
          onPressed: onTap,
          child: child),
    );
  }
}
