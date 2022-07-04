import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user.dart';

class Auth with ChangeNotifier {
  String? token;
  User? userDetail;

  Future<void> signup(
      email, password, confirmPassword, name, phoneNumber, userName) async {
    var url = Uri.parse('https://app-dev-task.herokuapp.com/users/register');

    //Breaking the full name entered to first name and last name
    final nameArray = name.split(' ');
    String firstName;
    String lastName;
    if (nameArray.length == 1) {
      firstName = nameArray[0];
      lastName = '';
    } else {
      firstName = nameArray[0];
      lastName = nameArray[1];
    }

    //Signup Snippet
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          {
            "email": email,
            "password": password,
            "passwordCheck": confirmPassword,
            "first_name": firstName,
            "last_name": lastName,
            "username": userName,
            "phone_number": phoneNumber
          },
        ),
      );
      final parsedResponse = json.decode(response.body);
      if (response.statusCode >= 400) {
        // print(parsedResponse["msg"]);
        throw (parsedResponse["msg"]);
      }
    } catch (error) {
      throw error;
    }
  }
}
