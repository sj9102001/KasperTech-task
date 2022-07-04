import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  DetailWidget({
    Key? key,
    required this.name,
    required this.address,
    required this.phoneNumber,
  }) : super(key: key);

  String name;
  String address;
  String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            key: Key(name.toString()),
            initialValue: name,
            enabled: false,
            decoration: _buildInputDecoration('Name'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            key: Key(address.toString()),
            initialValue: address,
            enabled: false,
            decoration: _buildInputDecoration('Address'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            key: Key(phoneNumber.toString()),
            initialValue: phoneNumber,
            enabled: false,
            decoration: _buildInputDecoration('Mobile Number'),
          ),
        ),
      ],
    ));
  }
}

InputDecoration _buildInputDecoration(text) {
  return InputDecoration(
      labelText: text,
      labelStyle: const TextStyle(color: Colors.black54),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black54, width: 2),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 2),
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 2),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
      contentPadding: const EdgeInsets.all(20),
      border: InputBorder.none);
}
