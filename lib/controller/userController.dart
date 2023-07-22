import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/userModel.dart';
import 'package:http/http.dart' as http;

class UserController{

  Future<User> fetchUserData() async {
    var url = Uri.parse('http://healthtracker.frmawy.com/api/user/profile');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('auth_token');
    var response = await http.get(
      url,
      headers: {
        'Authorization': '$authToken',
      },

    );

    if (response.statusCode == 200) {
      print("sssssssssssssss${response.body}");
      var userData = jsonDecode(response.body);
      return User.fromJson(userData);
    } else {
      throw Exception('Failed to fetch user data');
    }
  }
}