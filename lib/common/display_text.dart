import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DisplayText extends StatelessWidget {
  DisplayText({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
