// To parse this JSON data, do
//
//     final getEventNameModel = getEventNameModelFromJson(jsonString);

import 'dart:convert';

GetEventNameModel getEventNameModelFromJson(String str) => GetEventNameModel.fromJson(json.decode(str));

String getEventNameModelToJson(GetEventNameModel data) => json.encode(data.toJson());

class GetEventNameModel {
  String? status;
  String? message;
  int? code;
  List<EventNameData>? eventNameData;

  GetEventNameModel({
    this.status,
    this.message,
    this.code,
    this.eventNameData,
  });

  factory GetEventNameModel.fromJson(Map<String, dynamic> json) => GetEventNameModel(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    eventNameData: json["data"] == null ? [] : List<EventNameData>.from(json["data"]!.map((x) => EventNameData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": eventNameData == null ? [] : List<dynamic>.from(eventNameData!.map((x) => x.toJson())),
  };
}

class EventNameData {
  int? id;
  String? title;
  String? eventDate;
  DateTime? createdAt;
  DateTime? updatedAt;

  EventNameData({
    this.id,
    this.title,
    this.eventDate,
    this.createdAt,
    this.updatedAt,
  });

  factory EventNameData.fromJson(Map<String, dynamic> json) => EventNameData(
    id: json["id"],
    title: json["title"],
    eventDate: json["event_date"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "event_date": eventDate,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
