import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/authModel.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    var url = Uri.parse("http://healthtracker.frmawy.com/api/user/login");
    final response = await http.post(url, body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = json.decode(response.body);
      String authToken = jsonResponse['data']['token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', authToken);
      return LoginResponseModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
