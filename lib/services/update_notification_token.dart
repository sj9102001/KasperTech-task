import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> updateNotificationToken(token, id) async {
  var url =
      Uri.parse('https://app-dev-task.herokuapp.com/users/notificationToken');

  try {
    final response = await http.put(
      url,
      headers: {'x-auth-token': token, 'Content-Type': 'application/json'},
      body: json.encode(
        {"token": token, "user_id": id},
      ),
    );
    if (response.statusCode >= 400) {
      throw ('Error occured while updating token');
    }
  } catch (error) {
    rethrow; //rethrow to show dialog in login page
  }
}
