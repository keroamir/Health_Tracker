import 'dart:convert';

import 'package:HealthTracker/model/homeApiModel.dart';
import 'package:http/http.dart' as http;

class HomeApi {
  Future<List<Datum>> GetImages() async {
    List<Datum> datum = [];
    var url = Uri.parse("http://healthtracker.frmawy.com/api/user/slider");
    print("Url ===> $url");
    var response = await http.get(url);
    print("response ===> $response");
    var responseBody = jsonDecode(response.body)["data"];
    print("responsebody ===> $responseBody");
    for (var i in responseBody) {
      datum.add(Datum(
            id: i["id"], image: i['image']),
      );
    }
    return datum;
  }
}