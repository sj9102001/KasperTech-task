import 'package:flutter/material.dart';
import 'package:kaspertechtask/screens/task/upcoming_task.dart';

import './../../common/drawer.dart';
import './../../common/display_text.dart';

import '/screens/task/current_task.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class TaskPage extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  static const routeName = '/taskpage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CurrentTask(),
          UpcomingTask(),
        ],
      ),
    );
  }
}
