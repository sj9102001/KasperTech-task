import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/auth.dart';
import '/common/custom_button.dart';
import '/common/display_text.dart';
import '../../common/dialogs.dart';

import './../../services/send_notification.dart';

class UpcomingTask extends StatelessWidget {
  const UpcomingTask({Key? key}) : super(key: key);
  Future<void> sendNotificationRequest(ctx, token, uid) async {
    try {
      final message = await sendNotification(token, uid);
      Dialogs.customShowDialog(ctx, 'Notified', message);
    } catch (e) {
      Dialogs.customShowDialog(ctx, 'Error', e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DisplayText(title: 'Upcoming task', fontsize: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DisplayText(
                    title: 'Tilak Nagar, Bikaner',
                    fontsize: 15,
                  ),
                  Icon(Icons.arrow_downward),
                  DisplayText(
                    title: 'MP Colony, Bikaner',
                    fontsize: 15,
                  )
                ],
              ),
              CustomButton(
                callbackFunction: () => sendNotificationRequest(
                    context, authProvider.token, authProvider.userDetail!.uid),
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.25,
                child: Text(
                  'Start',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
