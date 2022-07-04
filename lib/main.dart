import 'package:flutter/material.dart';
import 'package:kaspertechtask/screens/login/login_page.dart';
import 'package:kaspertechtask/screens/task/task_page.dart';

import 'package:provider/provider.dart';

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
          LoginPage.routeName: (ctx) => const LoginPage(),
          SignupPage.routeName: (ctx) => SignupPage(),
          TaskPage.routeName: (ctx) => TaskPage()
        },
        home: const Splash(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
        builder: (ctx, auth, _) =>
            auth.isAuth ? TaskPage() : const LoginPage());
  }
}
