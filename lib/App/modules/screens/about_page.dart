import 'package:flutter/material.dart';

class AboutSreen extends StatefulWidget {
   String about;
   AboutSreen(this.about);

  @override
  State<AboutSreen> createState() => _AboutSreenState();
}

class _AboutSreenState extends State<AboutSreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(widget.about,
         style: TextStyle(
          fontSize: 14,
          color: Colors.black.withOpacity(0.7),
        ),
        ),
      ),
    );
  }
}
