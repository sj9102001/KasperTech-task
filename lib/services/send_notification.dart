import 'package:http/http.dart' as http;
import 'dart:convert';

//this returns string to show success message shown in alertdialog in task screen
Future<String> sendNotification(token, id) async {
  var url =
      Uri.parse('https://app-dev-task.herokuapp.com/users/sendNotification');
  try {
    final response = await http.post(
      url,
      headers: {'x-auth-token': token, 'Content-Type': 'application/json'},
      body: json.encode(
        {"user_id": id},
      ),
    );
    print(response.body);
    if (response.statusCode >= 400) {
      throw ('Error occured while sending notification');
    }
    return json.decode(response.body)["message"];
  } catch (error) {
    rethrow;
  }
}
