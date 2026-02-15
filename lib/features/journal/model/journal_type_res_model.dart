// To parse this JSON data, do
//
//     final journaTypeListResModel = journaTypeListResModelFromJson(jsonString);

import 'dart:convert';

JournaTypeListResModel journaTypeListResModelFromJson(String str) =>
    JournaTypeListResModel.fromJson(json.decode(str));

String journaTypeListResModelToJson(JournaTypeListResModel data) =>
    json.encode(data.toJson());

class JournaTypeListResModel {
  int? status;
  bool? success;
  String? message;
  List<JournaType>? data;

  JournaTypeListResModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory JournaTypeListResModel.fromJson(Map<String, dynamic> json) =>
      JournaTypeListResModel(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<JournaType>.from(
                json["data"]!.map((x) => JournaType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class JournaType {
  int? id;
  String? name;
  String? slug;

  JournaType({
    this.id,
    this.name,
    this.slug,
  });

  factory JournaType.fromJson(Map<String, dynamic> json) => JournaType(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}
