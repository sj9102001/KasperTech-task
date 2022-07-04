import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum DialogAction { yes, abort }

class Dialogs {
  static Future<DialogAction> customShowDialog(
      BuildContext context, String title, String body) async {
    final action = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop(DialogAction.yes);
              },
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.04,
                // margin: const EdgeInsets.symmetric(
                //     vertical: 20, horizontal: 15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 182, 29),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.height * 0.2,
                child: const Text(
                  'Okay',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            )
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.abort;
  }
}
