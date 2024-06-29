// To parse this JSON data, do
//
//     final getEventListModel = getEventListModelFromJson(jsonString);

import 'dart:convert';

GetEventListModel getEventListModelFromJson(String str) => GetEventListModel.fromJson(json.decode(str));

String getEventListModelToJson(GetEventListModel data) => json.encode(data.toJson());

class GetEventListModel {
  String? status;
  String? message;
  int? code;
  List<Datum>? data;

  GetEventListModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory GetEventListModel.fromJson(Map<String, dynamic> json) => GetEventListModel(
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
  int? eventname;
  String? image;
  DateTime? date;
  String? reminer;
  dynamic reminerDate;
  String? budget;
  String? about;
  String? other_event_name;
  int? status;
  int? recurringStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? cost;
  Eventdetails? eventdetails;

  Datum({
    this.id,
    this.userId,
    this.eventname,
    this.image,
    this.date,
    this.reminer,
    this.reminerDate,
    this.budget,
    this.about,
    this.other_event_name,
    this.status,
    this.recurringStatus,
    this.createdAt,
    this.updatedAt,
    this.cost,
    this.eventdetails,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    eventname: json["eventname"],
    image: json["image"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    reminer: json["reminer"],
    reminerDate: json["reminer_date"],
    budget: json["budget"],
    about: json["about"],
    other_event_name: json["other_event_name"],
    status: json["status"],
    recurringStatus: json["recurring_status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    cost: json["cost"],
    eventdetails: json["eventdetails"] == null ? null : Eventdetails.fromJson(json["eventdetails"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "eventname": eventname,
    "other_event_name": other_event_name,
    "image": image,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "reminer": reminer,
    "reminer_date": reminerDate,
    "budget": budget,
    "about": about,
    "status": status,
    "recurring_status": recurringStatus,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "cost": cost,
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
