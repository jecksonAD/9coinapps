// To parse this JSON data, do
//
//     final luckyDrawResponse = luckyDrawResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LuckyDrawResponse luckyDrawResponseFromJson(String str) =>
    LuckyDrawResponse.fromJson(json.decode(str));

String luckyDrawResponseToJson(LuckyDrawResponse data) =>
    json.encode(data.toJson());

class LuckyDrawResponse {
  LuckyDrawResponse({
    required this.data,
  });

  final List<Datum> data;

  factory LuckyDrawResponse.fromJson(Map<String, dynamic> json) =>
      LuckyDrawResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
    required this.date,
    required this.prize,
    required this.prizeImage,
    required this.pointsNeeded,
    required this.maximum,
    required this.winner,
    required this.participants,
  });

  final int id;
  final String name;
  final dynamic createdAt;
  final DateTime? updatedAt;
  final String description;
  final int date;
  final String prize;
  final String prizeImage;
  final int pointsNeeded;
  final int maximum;
  final String winner;
  final List<dynamic>? participants;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        description: json["description"],
        date: json["date"],
        prize: json["prize"],
        prizeImage: json["prize_image"],
        pointsNeeded: json["Points_needed"],
        maximum: json["maximum"],
        winner: json["winner"],
        participants: json["participants"] == null ? null : List<dynamic>.from(json["participants"].map((x) => x)),
    );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "description": description,
        "date": date,
        "prize": prize,
        "prize_image": prizeImage,
        "Points_needed": pointsNeeded,
        "maximum": maximum,
        "winner": winner,
        "participants": List<dynamic>.from(participants!.map((x) => x)),
      };
}
