// To parse this JSON data, do
//
//     final profileResModel = profileResModelFromJson(jsonString);

import 'dart:convert';

ProfileResModel profileResModelFromJson(String str) =>
    ProfileResModel.fromJson(json.decode(str));

String profileResModelToJson(ProfileResModel data) =>
    json.encode(data.toJson());

class ProfileResModel {
  int? status;
  bool? success;
  String? message;
  Data? data;

  ProfileResModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory ProfileResModel.fromJson(Map<String, dynamic> json) =>
      ProfileResModel(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? id;
  String? email;
  dynamic fullName;
  dynamic avatar;

  Data({
    this.id,
    this.email,
    this.fullName,
    this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        fullName: json["full_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "full_name": fullName,
        "avatar": avatar,
      };
}
