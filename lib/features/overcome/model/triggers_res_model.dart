// To parse this JSON data, do
//
//     final triggesResModel = triggesResModelFromJson(jsonString);

import 'dart:convert';

List<TriggesResModel> triggesResModelFromJson(String str) =>
    List<TriggesResModel>.from(
        json.decode(str).map((x) => TriggesResModel.fromJson(x)));

String triggesResModelToJson(List<TriggesResModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TriggesResModel {
  int? id;
  String? name;
  bool? isCustom;

  TriggesResModel({
    this.id,
    this.name,
    this.isCustom,
  });

  factory TriggesResModel.fromJson(Map<String, dynamic> json) =>
      TriggesResModel(
        id: json["id"],
        name: json["name"],
        isCustom: json["is_custom"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_custom": isCustom,
      };
}
