// To parse this JSON data, do
//
//     final homeActivitiesResModel = homeActivitiesResModelFromJson(jsonString);

import 'dart:convert';

HomeActivitiesResModel homeActivitiesResModelFromJson(String str) =>
    HomeActivitiesResModel.fromJson(json.decode(str));

String homeActivitiesResModelToJson(HomeActivitiesResModel data) =>
    json.encode(data.toJson());

class HomeActivitiesResModel {
  int? status;
  bool? success;
  String? message;
  Data? data;

  HomeActivitiesResModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory HomeActivitiesResModel.fromJson(Map<String, dynamic> json) =>
      HomeActivitiesResModel(
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
  List<Activity>? activities;
  String? timeUntilReset;

  Data({
    this.activities,
    this.timeUntilReset,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        activities: json["activities"] == null
            ? []
            : List<Activity>.from(
                json["activities"]!.map((x) => Activity.fromJson(x))),
        timeUntilReset: json["time_until_reset"],
      );

  Map<String, dynamic> toJson() => {
        "activities": activities == null
            ? []
            : List<dynamic>.from(activities!.map((x) => x.toJson())),
        "time_until_reset": timeUntilReset,
      };
}

class Activity {
  int? id;
  String? name;
  String? icon;
  String? iconBgColor;
  int? totalTasks;
  int? masteredTasks;

  Activity({
    this.id,
    this.name,
    this.icon,
    this.iconBgColor,
    this.totalTasks,
    this.masteredTasks,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        iconBgColor: json["icon_bg_color"],
        totalTasks: json["total_tasks"],
        masteredTasks: json["mastered_tasks"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "icon_bg_color": iconBgColor,
        "total_tasks": totalTasks,
        "mastered_tasks": masteredTasks,
      };
}
