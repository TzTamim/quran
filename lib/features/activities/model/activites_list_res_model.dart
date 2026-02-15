// To parse this JSON data, do
//
//     final activityListResModel = activityListResModelFromJson(jsonString);

import 'dart:convert';

ActivityListResModel activityListResModelFromJson(String str) =>
    ActivityListResModel.fromJson(json.decode(str));

String activityListResModelToJson(ActivityListResModel data) =>
    json.encode(data.toJson());

class ActivityListResModel {
  int? status;
  bool? success;
  String? message;
  List<Activity>? data;

  ActivityListResModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory ActivityListResModel.fromJson(Map<String, dynamic> json) =>
      ActivityListResModel(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Activity>.from(
                json["data"]!.map((x) => Activity.fromJson(x))),
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

class Activity {
  int? id;
  String? name;
  String? icon;
  int? totalTasks;
  int? masteredTasks;

  Activity({
    this.id,
    this.name,
    this.icon,
    this.totalTasks,
    this.masteredTasks,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        totalTasks: json["total_tasks"],
        masteredTasks: json["mastered_tasks"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "total_tasks": totalTasks,
        "mastered_tasks": masteredTasks,
      };
}
