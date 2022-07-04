import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user.dart';

import '../services/update_notification_token.dart';

class Auth with ChangeNotifier {
  String? token;
  User? userDetail;

  bool get isAuth {
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> signup(
      email, password, confirmPassword, name, phoneNumber, userName) async {
    var url = Uri.parse('https://app-dev-task.herokuapp.com/users/register');

    //Splitting the full name entered to first name and last name
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
        throw (parsedResponse["msg"]);
      }
    } catch (error) {
      rethrow; //rethrow to show dialog in signnup page
    }
  }

  Future<void> login(email, password) async {
    final url = Uri.parse('https://app-dev-task.herokuapp.com/users/login');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          {"email": email, "password": password},
        ),
      );
      final parsedResponse = json.decode(response.body);
      if (response.statusCode >= 400) {
        throw (parsedResponse["msg"]);
      } else {
        token = parsedResponse["token"];
        userDetail = User(
            uid: parsedResponse["user"]["_id"],
            email: parsedResponse["user"]["email"],
            firstName: parsedResponse["user"]["first_name"],
            lastName: parsedResponse["user"]["last_name"],
            phoneNumber: parsedResponse["user"]["phone_number"],
            username: parsedResponse["user"]["username"]);
      }
      await updateNotificationToken(token, parsedResponse["user"]["_id"]);
      notifyListeners();
    } catch (error) {
      //Token and UserDetail is set to null to roll back any change in auth state when
      //An error is occured.
      token = null;
      userDetail = null;
      notifyListeners(); //Calling notifylisteners() in case the auth state has changed.
      rethrow; //rethrow to show dialog in login page
    }
  }

  void logout() {
    token = null;
    userDetail = null;
    notifyListeners();
  }
}
