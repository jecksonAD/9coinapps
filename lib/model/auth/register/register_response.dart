// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) =>
    json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    required this.success,
  });

  final Success success;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        success: Success.fromJson(json["success"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success.toJson(),
      };
}

class Success {
  Success({
    required this.name,
    required this.email,
    required this.gender,
    required this.address,
    required this.point,
    required this.qrcode,
    required this.phonenumber,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    required this.profilePhotoUrl,
  });

  final String name;
  final String email;
  final String gender;
  final String address;
  final int point;
  final String qrcode;
  final String phonenumber;
  final int id;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String profilePhotoUrl;

  factory Success.fromJson(Map<String, dynamic> json) => Success(
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        address: json["address"],
        point: json["point"],
        qrcode: json["qrcode"],
        phonenumber: json["phonenumber"],
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        profilePhotoUrl: json["profile_photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "gender": gender,
        "address": address,
        "point": point,
        "qrcode": qrcode,
        "phonenumber": phonenumber,
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "profile_photo_url": profilePhotoUrl,
      };
}
