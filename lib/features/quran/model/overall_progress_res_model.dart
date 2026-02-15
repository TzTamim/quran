// To parse this JSON data, do
//
//     final overallProgressResModel = overallProgressResModelFromJson(jsonString);

import 'dart:convert';

OverallProgressResModel overallProgressResModelFromJson(String str) =>
    OverallProgressResModel.fromJson(json.decode(str));

String overallProgressResModelToJson(OverallProgressResModel data) =>
    json.encode(data.toJson());

class OverallProgressResModel {
  int? status;
  bool? success;
  String? message;
  Data? data;

  OverallProgressResModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory OverallProgressResModel.fromJson(Map<String, dynamic> json) =>
      OverallProgressResModel(
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
  int? totalSurahs;
  int? completedSurahs;
  int? totalVerses;
  int? readVerses;
  String? overallProgress;
  int? totalPoints;

  Data({
    this.totalSurahs,
    this.completedSurahs,
    this.totalVerses,
    this.readVerses,
    this.overallProgress,
    this.totalPoints,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalSurahs: json["total_surahs"],
        completedSurahs: json["completed_surahs"],
        totalVerses: json["total_verses"],
        readVerses: json["read_verses"],
        overallProgress: json["overall_progress"],
        totalPoints: json["total_points"],
      );

  Map<String, dynamic> toJson() => {
        "total_surahs": totalSurahs,
        "completed_surahs": completedSurahs,
        "total_verses": totalVerses,
        "read_verses": readVerses,
        "overall_progress": overallProgress,
        "total_points": totalPoints,
      };
}
