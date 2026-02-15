// To parse this JSON data, do
//
//     final journalListResModel = journalListResModelFromJson(jsonString);

import 'dart:convert';

JournalListResModel journalListResModelFromJson(String str) =>
    JournalListResModel.fromJson(json.decode(str));

String journalListResModelToJson(JournalListResModel data) =>
    json.encode(data.toJson());

class JournalListResModel {
  int? status;
  bool? success;
  String? message;
  List<Journal>? data;

  JournalListResModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory JournalListResModel.fromJson(Map<String, dynamic> json) =>
      JournalListResModel(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Journal>.from(json["data"]!.map((x) => Journal.fromJson(x))),
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

class Journal {
  int? id;
  String? title;
  String? contentPreview;
  EntryType? mood;
  EntryType? entryType;
  bool? isFavorite;
  DateTime? createdAt;
  DateTime? updatedAt;

  Journal({
    this.id,
    this.title,
    this.contentPreview,
    this.mood,
    this.entryType,
    this.isFavorite,
    this.createdAt,
    this.updatedAt,
  });

  factory Journal.fromJson(Map<String, dynamic> json) => Journal(
        id: json["id"],
        title: json["title"],
        contentPreview: json["content_preview"],
        mood: json["mood"] == null ? null : EntryType.fromJson(json["mood"]),
        entryType: json["entry_type"] == null
            ? null
            : EntryType.fromJson(json["entry_type"]),
        isFavorite: json["is_favorite"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content_preview": contentPreview,
        "mood": mood?.toJson(),
        "entry_type": entryType?.toJson(),
        "is_favorite": isFavorite,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class EntryType {
  int? id;
  String? name;
  String? slug;

  EntryType({
    this.id,
    this.name,
    this.slug,
  });

  factory EntryType.fromJson(Map<String, dynamic> json) => EntryType(
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
