// To parse this JSON data, do
//
//     final getEventReminderModel = getEventReminderModelFromJson(jsonString);

import 'dart:convert';

GetEventReminderModel getEventReminderModelFromJson(String str) => GetEventReminderModel.fromJson(json.decode(str));

String getEventReminderModelToJson(GetEventReminderModel data) => json.encode(data.toJson());

class GetEventReminderModel {
  GetEventReminderModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  List<ReminderDatum>? data;

  factory GetEventReminderModel.fromJson(Map<String, dynamic> json) => GetEventReminderModel(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: json["data"] == null ? [] : List<ReminderDatum>.from(json["data"]!.map((x) => ReminderDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ReminderDatum {
  ReminderDatum({
    this.id,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ReminderDatum.fromJson(Map<String, dynamic> json) => ReminderDatum(
    id: json["id"],
    title: json["title"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
