// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.statusCode,
    required this.status,
    required this.accessToken,
    required this.tokenType,
    required this.data,
  });

  final int statusCode;
  final int status;
  final String accessToken;
  final String tokenType;
  final Data data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        statusCode: json["status_code"],
        status: json["status"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "status": status,
        "access_token": accessToken,
        "token_type": tokenType,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.phonenumber,
    required this.address,
    required this.about,
    required this.createdAt,
    required this.updatedAt,
    required this.avatarphotourl,
    required this.currentTeamId,
    required this.profilePhotoPath,
    required this.gender,
    required this.point,
    required this.qrcode,
    required this.deviceId,
    required this.profilePhotoUrl,
  });

  final int id;
  final String name;
  final String email;
  final dynamic emailVerifiedAt;
  final String phonenumber;
  final String address;
  final dynamic about;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic avatarphotourl;
  final dynamic currentTeamId;
  final dynamic profilePhotoPath;
  final String gender;
  final dynamic point;
  final String qrcode;
  final dynamic deviceId;
  final String profilePhotoUrl;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phonenumber: json["phonenumber"],
        address: json["address"],
        about: json["about"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        avatarphotourl: json["avatarphotourl"],
        currentTeamId: json["current_team_id"],
        profilePhotoPath: json["profile_photo_path"],
        gender: json["gender"],
        point: json["point"],
        qrcode: json["qrcode"],
        deviceId: json["device_id"],
        profilePhotoUrl: json["profile_photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phonenumber": phonenumber,
        "address": address,
        "about": about,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "avatarphotourl": avatarphotourl,
        "current_team_id": currentTeamId,
        "profile_photo_path": profilePhotoPath,
        "gender": gender,
        "point": point,
        "qrcode": qrcode,
        "device_id": deviceId,
        "profile_photo_url": profilePhotoUrl,
      };
}
