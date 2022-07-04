import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DisplayText extends StatelessWidget {
  DisplayText({Key? key, required this.title, required this.fontsize})
      : super(key: key);
  String title;
  double fontsize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontsize,
      ),
    );
  }
}
