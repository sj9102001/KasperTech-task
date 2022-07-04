import 'package:flutter/material.dart';
import 'package:kaspertechtask/common/dialogs.dart';
import 'package:kaspertechtask/providers/auth.dart';

import 'package:kaspertechtask/screens/task/upcoming_task.dart';
import 'package:provider/provider.dart';

import './../../common/drawer.dart';

import 'package:cron/cron.dart';

import '/screens/task/current_task.dart';

import '../../services/add_coordinates.dart';

class TaskPage extends StatefulWidget {
  static const routeName = '/taskpage';

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final cron = Cron();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth>(context);

    //Scheduling a Cron for two minutes to call addCoordinates API
    cron.schedule(Schedule.parse('*/2 * * * *'), () async {
      try {
        final response = await addCoordinates(authProvider.token.toString());
      } catch (error) {
        await Dialogs.customShowDialog(context, 'Error',
            error.toString()); //Showing custom dialog in case of error
      }
    });
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CurrentTask(),
            UpcomingTask(),
          ],
        ),
      ),
    );
  }
}
