import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kaspertechtask/screens/Login/login_page.dart';
import 'package:kaspertechtask/screens/home/home_page.dart';
import './screens/signup/signup_page.dart';
import 'package:kaspertechtask/splash.dart';

import 'providers/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Auth()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          LoginPage.routeName: (ctx) => LoginPage(),
          SignupPage.routeName: (ctx) => SignupPage()
        },
        home: Splash(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  bool isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? HomePage() : LoginPage();
  }
}
