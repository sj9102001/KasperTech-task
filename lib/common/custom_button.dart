import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.callbackFunction,
      required this.height,
      required this.width,
      required this.child})
      : super(key: key);

  VoidCallback callbackFunction;
  double height;
  double width;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callbackFunction,
      child: Container(
          alignment: Alignment.center,
          height: height,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 182, 29),
            borderRadius: BorderRadius.circular(10),
          ),
          width: width,
          child: child),
    );
  }
}
