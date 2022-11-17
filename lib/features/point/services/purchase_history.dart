import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/config.dart';
import 'package:http/http.dart' as http;
import '../../../model/transaction/get_history_transaction.dart';

Future<GetHistoryTransaction> purchaseHistory() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String url = Api.getPdf;
  print(url);
  var uri = Uri.parse(url);

  var response = await http.get(
    uri,
    headers: {
      "Content-Type": "application/json",
      "Authorization": "${prefs.getString("jwtType")} ${prefs.getString("jwt")}"
    },
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    return GetHistoryTransaction.fromJson(json.decode(response.body));
  } else {
    throw json.decode(response.body)["error"];
  }
}
