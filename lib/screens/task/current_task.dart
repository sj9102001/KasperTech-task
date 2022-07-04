import 'package:flutter/material.dart';
import 'package:kaspertechtask/common/custom_button.dart';
import 'package:kaspertechtask/common/display_text.dart';
import 'package:kaspertechtask/screens/task/detail_widget.dart';

class CurrentTask extends StatefulWidget {
  CurrentTask({
    Key? key,
  }) : super(key: key);

  @override
  State<CurrentTask> createState() => _CurrentTaskState();
}

class _CurrentTaskState extends State<CurrentTask> {
  String _name = 'Dhairya';
  String _address = 'Museum Circle Bikaner';
  String _phoneNumber = '78776 37947';
  String _fromName = 'Krishna Ojha';
  String _fromAddress = 'Ojha bhawan, Civil lines Bikaner';

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DisplayText(
            title: 'Current Task',
            fontsize: 35,
          ),
          DetailWidget(
              name: _name, address: _address, phoneNumber: _phoneNumber),
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
                          title: 'From: ${_fromName}',
                          fontsize: 20,
                        ),
                      ),
                      Container(
                        width: 200,
                        child: DisplayText(
                          title: _fromAddress,
                          fontsize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: CustomButton(
                      callbackFunction: () {
                        print('status pressed');
                      },
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
      ),
    );
  }
}