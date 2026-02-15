// To parse this JSON data, do
//
//     final surahListResModel = surahListResModelFromJson(jsonString);

import 'dart:convert';

SurahListResModel surahListResModelFromJson(String str) =>
    SurahListResModel.fromJson(json.decode(str));

String surahListResModelToJson(SurahListResModel data) =>
    json.encode(data.toJson());

class SurahListResModel {
  int? status;
  bool? success;
  String? message;
  Data? data;

  SurahListResModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory SurahListResModel.fromJson(Map<String, dynamic> json) =>
      SurahListResModel(
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
  int? surahsCompleted;
  int? versesRead;
  double? overallProgressPercentage;
  List<Surah>? surahs;

  Data({
    this.surahsCompleted,
    this.versesRead,
    this.overallProgressPercentage,
    this.surahs,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        surahsCompleted: json["surahs_completed"],
        versesRead: json["verses_read"],
        overallProgressPercentage: json["overall_progress_percentage"],
        surahs: json["surahs"] == null
            ? []
            : List<Surah>.from(json["surahs"]!.map((x) => Surah.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "surahs_completed": surahsCompleted,
        "verses_read": versesRead,
        "overall_progress_percentage": overallProgressPercentage,
        "surahs": surahs == null
            ? []
            : List<dynamic>.from(surahs!.map((x) => x.toJson())),
      };
}

class Surah {
  int? id;
  int? number;
  String? nameArabic;
  String? nameEnglish;
  String? nameMeaning;
  String? surahType;
  int? totalVerses;
  double? progressPercentage;

  Surah({
    this.id,
    this.number,
    this.nameArabic,
    this.nameEnglish,
    this.nameMeaning,
    this.surahType,
    this.totalVerses,
    this.progressPercentage,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        id: json["id"],
        number: json["number"],
        nameArabic: json["name_arabic"],
        nameEnglish: json["name_english"],
        nameMeaning: json["name_meaning"],
        surahType: json["surah_type"],
        totalVerses: json["total_verses"],
        progressPercentage: json["progress_percentage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "name_arabic": nameArabic,
        "name_english": nameEnglish,
        "name_meaning": nameMeaning,
        "surah_type": surahType,
        "total_verses": totalVerses,
        "progress_percentage": progressPercentage,
      };
}
