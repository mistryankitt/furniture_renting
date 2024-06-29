// To parse this JSON data, do
//
//     final createEventRequestModel = createEventRequestModelFromJson(jsonString);

import 'dart:convert';

CreateEventRequestModel createEventRequestModelFromJson(String str) => CreateEventRequestModel.fromJson(json.decode(str));

String createEventRequestModelToJson(CreateEventRequestModel data) => json.encode(data.toJson());

class CreateEventRequestModel {
  CreateEventRequestModel({
    required this.eventname,
    required this.reminer,
    required this.date,
    required this.budget,
    required this.about,
    this.image,
    this.id,
    this.otherEventName,
    required this.recurringStatus,
  });

  String eventname;
  String? otherEventName;
  List<String>? reminer;
  String date;
  String? id;
  String budget;
  String about;
  String? image;
  String recurringStatus;

  factory CreateEventRequestModel.fromJson(Map<String, dynamic> json) => CreateEventRequestModel(
    eventname: json["eventname"],
    reminer: json["reminer"] == null ? [] : List<String>.from(json["reminer"]!.map((x) => x)),
    date: json["date"],
    id: json["id"],
    otherEventName: json["other_event_name"],
    budget: json["budget"],
    about: json["about"],
    image: json["image"],
    recurringStatus: json["recurring_status"],
  );

  Map<String, String> toJson() => {
    "eventname": eventname,
    "reminer": reminer == null ? [].toString() : List<dynamic>.from(reminer!.map((x) => x)).toString(),
    "date": date,
    "id": id.toString(),
    "budget": budget,
    "about": about,
    "other_event_name": otherEventName ?? "",
    "image": image.toString(),
    "recurring_status": recurringStatus,
  };
}



CreateEventResponseModel createEventResponseModelFromJson(String str) => CreateEventResponseModel.fromJson(json.decode(str));

String createEventResponseModelToJson(CreateEventResponseModel data) => json.encode(data.toJson());

class CreateEventResponseModel {
  CreateEventResponseModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  Data? data;

  factory CreateEventResponseModel.fromJson(Map<String, dynamic> json) => CreateEventResponseModel(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.eventname,
    this.reminer,
    this.userId,
    this.date,
    this.budget,
    this.about,
    this.recurringStatus,
    this.image,
    this.id,
  });

  String? eventname;
  String? reminer;
  int? userId;
  String? date;
  String? budget;
  String? about;
  String? recurringStatus;
  String? image;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    eventname: json["eventname"],
    reminer: json["reminer"],
    userId: json["user_id"],
    date: json["date"],
    budget: json["budget"],
    about: json["about"],
    recurringStatus: json["recurring_status"],
    image: json["image"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "eventname": eventname,
    "reminer": reminer,
    "user_id": userId,
    "date": date,
    "budget": budget,
    "about": about,
    "recurring_status": recurringStatus,
    "image": image,
    "id": id,
  };
}
