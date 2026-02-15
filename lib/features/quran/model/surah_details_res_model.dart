// To parse this JSON data, do
//
//     final surahDetailsResModel = surahDetailsResModelFromJson(jsonString);

import 'dart:convert';

SurahDetailsResModel surahDetailsResModelFromJson(String str) =>
    SurahDetailsResModel.fromJson(json.decode(str));

String surahDetailsResModelToJson(SurahDetailsResModel data) =>
    json.encode(data.toJson());

class SurahDetailsResModel {
  int? status;
  bool? success;
  String? message;
  Data? data;

  SurahDetailsResModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory SurahDetailsResModel.fromJson(Map<String, dynamic> json) =>
      SurahDetailsResModel(
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
  int? number;
  String? nameEnglish;
  String? nameMeaning;
  String? nameArabic;
  int? totalVerses;
  String? surahType;
  String? readingProgress;
  int? completedVerses;
  List<Verse>? verses;

  Data({
    this.number,
    this.nameEnglish,
    this.nameMeaning,
    this.nameArabic,
    this.totalVerses,
    this.surahType,
    this.readingProgress,
    this.completedVerses,
    this.verses,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        number: json["number"],
        nameEnglish: json["name_english"],
        nameMeaning: json["name_meaning"],
        nameArabic: json["name_arabic"],
        totalVerses: json["total_verses"],
        surahType: json["surah_type"],
        readingProgress: json["reading_progress"],
        completedVerses: json["completed_verses"],
        verses: json["verses"] == null
            ? []
            : List<Verse>.from(json["verses"]!.map((x) => Verse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name_english": nameEnglish,
        "name_meaning": nameMeaning,
        "name_arabic": nameArabic,
        "total_verses": totalVerses,
        "surah_type": surahType,
        "reading_progress": readingProgress,
        "completed_verses": completedVerses,
        "verses": verses == null
            ? []
            : List<dynamic>.from(verses!.map((x) => x.toJson())),
      };
}

class Verse {
  int? verseId;
  int? verseNumber;
  String? textArabic;
  String? textEnglish;
  bool? isRead;

  Verse({
    this.verseId,
    this.verseNumber,
    this.textArabic,
    this.textEnglish,
    this.isRead,
  });

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        verseId: json["verse_id"],
        verseNumber: json["verse_number"],
        textArabic: json["text_arabic"],
        textEnglish: json["text_english"],
        isRead: json["is_read"],
      );

  Map<String, dynamic> toJson() => {
        "verse_id": verseId,
        "verse_number": verseNumber,
        "text_arabic": textArabic,
        "text_english": textEnglish,
        "is_read": isRead,
      };
}
