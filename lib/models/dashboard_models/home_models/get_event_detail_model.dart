// To parse this JSON data, do
//
//     final getEventDetailModel = getEventDetailModelFromJson(jsonString);

import 'dart:convert';

GetEventDetailModel getEventDetailModelFromJson(String str) =>
    GetEventDetailModel.fromJson(json.decode(str));

String getEventDetailModelToJson(GetEventDetailModel data) =>
    json.encode(data.toJson());

class GetEventDetailModel {
  String? status;
  String? message;
  int? code;
  GetEventDetailsData? data;

  GetEventDetailModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory GetEventDetailModel.fromJson(Map<String, dynamic> json) =>
      GetEventDetailModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : GetEventDetailsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data?.toJson(),
      };
}

class GetEventDetailsData {
  int? id;
  int? userId;
  int? eventname;
  String? image;
  DateTime? date;
  String? reminer;
  String? other_event_name;
  DateTime? reminerDate;
  String? budget;
  String? cost;
  String? about;
  int? status;
  int? recurringStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  Eventdetails? eventdetails;

  GetEventDetailsData({
    this.id,
    this.userId,
    this.eventname,
    this.image,
    this.date,
    this.reminer,
    this.reminerDate,
    this.budget,
    this.cost,
    this.about,
    this.other_event_name,
    this.status,
    this.recurringStatus,
    this.createdAt,
    this.updatedAt,
    this.eventdetails,
  });

  factory GetEventDetailsData.fromJson(Map<String, dynamic> json) =>
      GetEventDetailsData(
        id: json["id"],
        userId: json["user_id"],
        eventname: json["eventname"],
        image: json["image"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        reminer: json["reminer"],
        reminerDate: json["reminer_date"] == null
            ? null
            : DateTime.parse(json["reminer_date"]),
        budget: json["budget"],
        cost: json["cost"],
        about: json["about"],
        other_event_name: json["other_event_name"],
        status: json["status"],
        recurringStatus: json["recurring_status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        eventdetails: json["eventdetails"] == null
            ? null
            : Eventdetails.fromJson(json["eventdetails"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "eventname": eventname,
        "image": image,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "reminer": reminer,
        "reminer_date": reminerDate?.toIso8601String(),
        "budget": budget,
        "cost": cost,
        "about": about,
        "other_event_name": other_event_name,
        "status": status,
        "recurring_status": recurringStatus,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "eventdetails": eventdetails?.toJson(),
      };
}

class Eventdetails {
  int? id;
  String? title;

  Eventdetails({
    this.id,
    this.title,
  });

  factory Eventdetails.fromJson(Map<String, dynamic> json) => Eventdetails(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
