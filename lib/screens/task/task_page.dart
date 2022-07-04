import 'package:flutter/material.dart';
import 'package:kaspertechtask/common/drawer.dart';

class TaskPage extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  static const routeName = '/taskpage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
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
      body: Center(
        child: Text('Task Page'),
      ),
    );
  }
}
