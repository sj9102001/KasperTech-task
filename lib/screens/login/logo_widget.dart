import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height * 0.3,
      margin: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.topCenter,
      width: double.infinity,
      color: Colors.white,
      child: Image.asset('assets/login.png'),
    );
  }
}
