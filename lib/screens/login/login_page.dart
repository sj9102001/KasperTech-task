import 'package:flutter/material.dart';
import 'package:kaspertechtask/screens/Login/login_form.dart';
import 'package:kaspertechtask/screens/Login/login_welcome_text.dart';
import 'package:kaspertechtask/screens/Login/logo_widget.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LogoWidget(),
            const LoginWelcomeTextWidget(),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
