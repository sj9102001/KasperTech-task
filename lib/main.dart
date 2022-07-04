import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/login/login_page.dart';
import '/screens/task/task_page.dart';

import './screens/signup/signup_page.dart';
import '/splash.dart';

import 'providers/auth.dart';
import '/providers/order_delivery_data_provider.dart';

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
        ChangeNotifierProvider(create: (ctx) => OrderDeliveryDataProvider()),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
        builder: (ctx, auth, _) =>
            auth.isAuth ? TaskPage() : const LoginPage());
  }
}
