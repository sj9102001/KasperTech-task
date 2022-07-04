import 'package:flutter/material.dart';
import 'package:kaspertechtask/common/display_text.dart';
import 'package:kaspertechtask/common/drawer.dart';

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
        children: const [
          CurrentTask(),
        ],
      ),
    );
  }
}

class CurrentTask extends StatelessWidget {
  const CurrentTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      height: MediaQuery.of(context).size.height * 0.46,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 255, 182, 29),
          width: 4,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          DisplayText(
            title: 'Current Task',
          )
        ],
      ),
    );
  }
}
