// To parse this JSON data, do
//
//     final getNotificaitonModel = getNotificaitonModelFromJson(jsonString);

import 'dart:convert';

GetNotificationModel getNotificationModelFromJson(String str) => GetNotificationModel.fromJson(json.decode(str));

String getNotificationModelToJson(GetNotificationModel data) => json.encode(data.toJson());

class GetNotificationModel {
  String? status;
  String? message;
  int? code;
  List<Datum>? data;

  GetNotificationModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory GetNotificationModel.fromJson(Map<String, dynamic> json) => GetNotificationModel(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  int? userId;
  int? eventId;
  String? title;
  String? body;
  int? read;
  String? notifyTime;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.userId,
    this.eventId,
    this.title,
    this.body,
    this.read,
    this.notifyTime,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    eventId: json["event_id"],
    title: json["title"],
    body: json["body"],
    read: json["read"],
    notifyTime: json["notify_time"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "event_id": eventId,
    "title": title,
    "body": body,
    "read": read,
    "notify_time": notifyTime,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
