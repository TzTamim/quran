// To parse this JSON data, do
//
//     final journalMoodListResModel = journalMoodListResModelFromJson(jsonString);

import 'dart:convert';

JournalMoodListResModel journalMoodListResModelFromJson(String str) =>
    JournalMoodListResModel.fromJson(json.decode(str));

String journalMoodListResModelToJson(JournalMoodListResModel data) =>
    json.encode(data.toJson());

class JournalMoodListResModel {
  int? status;
  bool? success;
  String? message;
  List<Mood>? data;

  JournalMoodListResModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory JournalMoodListResModel.fromJson(Map<String, dynamic> json) =>
      JournalMoodListResModel(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Mood>.from(json["data"]!.map((x) => Mood.fromJson(x))),
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

class Mood {
  int? id;
  String? name;
  String? slug;

  Mood({
    this.id,
    this.name,
    this.slug,
  });

  factory Mood.fromJson(Map<String, dynamic> json) => Mood(
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
