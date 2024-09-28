import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FaqQuestion extends StatefulWidget {
  const FaqQuestion({Key? key}) : super(key: key);

  @override
  State<FaqQuestion> createState() => _FaqQuestionState();
}

class _FaqQuestionState extends State<FaqQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Center(child: Text("Faq Question")),
    );
  }
}
