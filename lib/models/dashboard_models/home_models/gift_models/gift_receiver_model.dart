// To parse this JSON data, do
//
//     final addGiftReceiverRequestModel = addGiftReceiverRequestModelFromJson(jsonString);

import 'dart:convert';

AddGiftReceiverRequestModel addGiftReceiverRequestModelFromJson(String str) => AddGiftReceiverRequestModel.fromJson(json.decode(str));

String addGiftReceiverRequestModelToJson(AddGiftReceiverRequestModel data) => json.encode(data.toJson());

class AddGiftReceiverRequestModel {
  AddGiftReceiverRequestModel({
    this.name,
    this.image,
    this.eventId,
    this.categoryId,
    this.personId,
    this.id,
  });

  String? name;
  String? image;
  String? eventId;
  String? categoryId;
  String? personId;
  String? id;

  factory AddGiftReceiverRequestModel.fromJson(Map<String, dynamic> json) => AddGiftReceiverRequestModel(
    name: json["name"],
    image: json["image"],
    eventId: json["event_id"],
    categoryId: json["category_id"],
    personId: json["person_id"],
    id: json["id"],
  );

  Map<String, String> toJson() => {
    "name": name ?? "",
    "image": image ?? "",
    "event_id": eventId ?? "",
    "category_id": categoryId ?? "",
    "person_id": personId ?? "",
    "id": id ?? ""
  };
}



AddGiftReceiverResponseModel addGiftReceiverResponseModelFromJson(String str) => AddGiftReceiverResponseModel.fromJson(json.decode(str));

String addGiftReceiverResponseModelToJson(AddGiftReceiverResponseModel data) => json.encode(data.toJson());

class AddGiftReceiverResponseModel {
  AddGiftReceiverResponseModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  Data? data;

  factory AddGiftReceiverResponseModel.fromJson(Map<String, dynamic> json) => AddGiftReceiverResponseModel(
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
    this.name,
    this.eventId,
    this.userId,
    this.categoryId,
    this.personId,
    this.id,
  });

  String? name;
  String? eventId;
  int? userId;
  String? categoryId;
  String? personId;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    eventId: json["event_id"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    personId: json["person_id"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "event_id": eventId,
    "user_id": userId,
    "category_id": categoryId,
    "person_id": personId,
    "id": id,
  };
}
