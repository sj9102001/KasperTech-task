import 'package:flutter/material.dart';
import 'package:kaspertechtask/common/custom_button.dart';
import 'package:kaspertechtask/common/display_text.dart';

class UpcomingTask extends StatelessWidget {
  const UpcomingTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                callbackFunction: () {
                  print("Start pressed");
                },
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
