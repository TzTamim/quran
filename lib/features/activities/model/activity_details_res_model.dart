// To parse this JSON data, do
//
//     final activityDetailsResModel = activityDetailsResModelFromJson(jsonString);

import 'dart:convert';

ActivityDetailsResModel activityDetailsResModelFromJson(String str) =>
    ActivityDetailsResModel.fromJson(json.decode(str));

String activityDetailsResModelToJson(ActivityDetailsResModel data) =>
    json.encode(data.toJson());

class ActivityDetailsResModel {
  int? status;
  bool? success;
  String? message;
  Data? data;

  ActivityDetailsResModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory ActivityDetailsResModel.fromJson(Map<String, dynamic> json) =>
      ActivityDetailsResModel(
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
  int? id;
  String? name;
  String? icon;
  String? iconBgColor;
  int? totalTasks;
  int? masteredTasks;
  List<Task>? tasks;

  Data({
    this.id,
    this.name,
    this.icon,
    this.iconBgColor,
    this.totalTasks,
    this.masteredTasks,
    this.tasks,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        iconBgColor: json["icon_bg_color"],
        totalTasks: json["total_tasks"],
        masteredTasks: json["mastered_tasks"],
        tasks: json["tasks"] == null
            ? []
            : List<Task>.from(json["tasks"]!.map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "icon_bg_color": iconBgColor,
        "total_tasks": totalTasks,
        "mastered_tasks": masteredTasks,
        "tasks": tasks == null
            ? []
            : List<dynamic>.from(tasks!.map((x) => x.toJson())),
      };
}

class Task {
  int? id;
  String? title;
  String? description;
  int? targetCount;
  int? completedCount;
  double? rewardStars;
  String? status;
  bool? isCompleted;
  int? progressPercentage;

  Task({
    this.id,
    this.title,
    this.description,
    this.targetCount,
    this.completedCount,
    this.rewardStars,
    this.status,
    this.isCompleted,
    this.progressPercentage,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        targetCount: json["target_count"],
        completedCount: json["completed_count"],
        rewardStars: json["reward_stars"],
        status: json["status"],
        isCompleted: json["is_completed"],
        progressPercentage: json["progress_percentage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "target_count": targetCount,
        "completed_count": completedCount,
        "reward_stars": rewardStars,
        "status": status,
        "is_completed": isCompleted,
        "progress_percentage": progressPercentage,
      };
}
