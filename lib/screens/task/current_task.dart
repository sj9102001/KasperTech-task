import 'package:flutter/material.dart';
import 'package:kaspertechtask/common/dialogs.dart';
import 'package:kaspertechtask/providers/auth.dart';
import 'package:provider/provider.dart';

import '/common/custom_button.dart';
import '/common/display_text.dart';

import '/models/order_delivery_data.dart';

import '/providers/order_delivery_data_provider.dart';

import '/screens/task/detail_widget.dart';

import '/services/send_notification.dart';

class CurrentTask extends StatefulWidget {
  CurrentTask({
    Key? key,
  }) : super(key: key);

  @override
  State<CurrentTask> createState() => _CurrentTaskState();
}

class _CurrentTaskState extends State<CurrentTask> {
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
      margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      height: MediaQuery.of(context).size.height * 0.54,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 255, 182, 29),
          width: 4,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Consumer<OrderDeliveryDataProvider>(
          builder: (ctx, orderDeliveryData, _) {
        OrderDeliveryData current = orderDeliveryData.getCurrentDelivery();
        return Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DisplayText(
              title: 'Current Task',
              fontsize: 35,
            ),
            DetailWidget(
                name: current.name,
                address: current.address,
                phoneNumber: current.mobileNumber),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: DisplayText(
                            title: 'From: ${current.fromName}',
                            fontsize: 20,
                          ),
                        ),
                        Container(
                          width: 200,
                          child: DisplayText(
                            title: current.fromAddress,
                            fontsize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                        callbackFunction: () => sendNotificationRequest(context,
                            authProvider.token, authProvider.userDetail!.uid),
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Text(
                          'Status',
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
