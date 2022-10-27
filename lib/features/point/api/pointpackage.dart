import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/config.dart';
import 'package:http/http.dart' as http;

class pointpackage {
  Future<List> getpointpackage() async {
    String url = Api.getpointpackage;
    print(url);
    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
