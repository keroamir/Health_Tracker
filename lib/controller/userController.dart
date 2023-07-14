import 'dart:convert';

import '../model/userModel.dart';
import 'package:http/http.dart' as http;

class UserController{

  Future<User> fetchUserData(String? authToken) async {
    var url = Uri.parse('http://healthtracker.frmawy.com/api/user/profile');
    print("$authToken");
    var response = await http.get(
      url,
      headers: {
        'Authorization': '$authToken',
      },

    );

    if (response.statusCode == 200) {
      print(response.body);
      var userData = jsonDecode(response.body);
      return User.fromJson(userData);
    } else {
      throw Exception('Failed to fetch user data');
    }
  }
}