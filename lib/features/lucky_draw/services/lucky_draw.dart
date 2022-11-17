import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../config/config.dart';
import '../../../model/luckyDraw/lucky_draw_response.dart';
import '../../../model/luckyDraw/lucky_drawn_response.dart';

Future<LuckyDrawResponse> getLuckyDraw() async {
  String url = Api.getLuckyDraw;
  var uri = Uri.parse(url);

  var response = await http.get(
    uri,
    headers: {
      "Content-Type": "application/json",
    },
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    return LuckyDrawResponse.fromJson(json.decode(response.body));
  } else {
    throw json.decode(response.body)["error"];
  }
}
Future<LuckyDrawnResponse> getLuckyDrawn(String userId) async {
  String url = Api.getLuckyDrawn + userId;
  var uri = Uri.parse(url);

  var response = await http.get(
    uri,
    headers: {
      "Content-Type": "application/json",
    },
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    return LuckyDrawnResponse.fromJson(json.decode(response.body));
  } else {
    throw json.decode(response.body)["error"];
  }
}

Future<String> putLuckyDraw(String luckyDrawId, String userId) async {
  String url = "${Api.updatePartcipants}?lucky_draw_id=$luckyDrawId&participants[]=$userId";
  var uri = Uri.parse(url);

  var response = await http.put(
    uri,
    headers: {
      "Content-Type": "application/json",
    },
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    return "Success";
  } else {
    throw json.decode(response.body)["error"];
  }
}


Future<List> getWinner() async {
  String url = Api.getLuckyDraw;
  var uri = Uri.parse(url);

  var response = await http.get(
    uri,
    headers: {
      "Content-Type": "application/json",
    },
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    return json.decode(response.body)['data'];
  } else {
    throw json.decode(response.body)["error"];
  }
}
