import 'package:flutter/material.dart';

class LoginWelcomeTextWidget extends StatelessWidget {
  const LoginWelcomeTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      height: deviceSize.height * 0.11,
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      alignment: Alignment.topLeft,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          child: const Text(
            'Let\'s Sign you in.',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        const Text(
          'Welcome back.',
          style: TextStyle(fontSize: 17),
        ),
        const Text(
          'You have been missed!',
          style: TextStyle(fontSize: 17),
        ),
      ]),
    );
  }
}
