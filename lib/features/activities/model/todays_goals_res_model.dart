// To parse this JSON data, do
//
//     final todaysGoalsResModel = todaysGoalsResModelFromJson(jsonString);

import 'dart:convert';

TodaysGoalsResModel todaysGoalsResModelFromJson(String str) =>
    TodaysGoalsResModel.fromJson(json.decode(str));

String todaysGoalsResModelToJson(TodaysGoalsResModel data) =>
    json.encode(data.toJson());

class TodaysGoalsResModel {
  int? status;
  bool? success;
  String? message;
  Data? data;

  TodaysGoalsResModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory TodaysGoalsResModel.fromJson(Map<String, dynamic> json) =>
      TodaysGoalsResModel(
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
  int? totalGoals;
  int? completed;
  List<Goal>? goals;

  Data({
    this.totalGoals,
    this.completed,
    this.goals,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalGoals: json["total_goals"],
        completed: json["completed"],
        goals: json["goals"] == null
            ? []
            : List<Goal>.from(json["goals"]!.map((x) => Goal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_goals": totalGoals,
        "completed": completed,
        "goals": goals == null
            ? []
            : List<dynamic>.from(goals!.map((x) => x.toJson())),
      };
}

class Goal {
  int? id;
  String? icon;
  String? iconBgColor;
  String? title;
  String? rewardStars;
  bool? isCompleted;

  Goal({
    this.id,
    this.icon,
    this.iconBgColor,
    this.title,
    this.rewardStars,
    this.isCompleted,
  });

  factory Goal.fromJson(Map<String, dynamic> json) => Goal(
        id: json["id"],
        icon: json["icon"],
        iconBgColor: json["icon_bg_color"],
        title: json["title"],
        rewardStars: json["reward_stars"],
        isCompleted: json["is_completed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "icon_bg_color": iconBgColor,
        "title": title,
        "reward_stars": rewardStars,
        "is_completed": isCompleted,
      };
}
