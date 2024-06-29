// To parse this JSON data, do
//
//     final getGiftReceiverDetailsModel = getGiftReceiverDetailsModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final getGiftReceiverDetailsModel = getGiftReceiverDetailsModelFromJson(jsonString);

import 'dart:convert';

GetGiftReceiverDetailsModel getGiftReceiverDetailsModelFromJson(String str) => GetGiftReceiverDetailsModel.fromJson(json.decode(str));

String getGiftReceiverDetailsModelToJson(GetGiftReceiverDetailsModel data) => json.encode(data.toJson());

class GetGiftReceiverDetailsModel {
  String? status;
  String? message;
  int? code;
  GiftReceiverData? data;

  GetGiftReceiverDetailsModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory GetGiftReceiverDetailsModel.fromJson(Map<String, dynamic> json) => GetGiftReceiverDetailsModel(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: json["data"] == null ? null : GiftReceiverData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data?.toJson(),
  };
}

class GiftReceiverData {
  int? id;
  int? eventId;
  int? userId;
  String? name;
  String? image;
  int? categoryId;
  int? personId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Deatils? categorydeatils;
  Deatils? persondeatils;

  GiftReceiverData({
    this.id,
    this.eventId,
    this.userId,
    this.name,
    this.image,
    this.categoryId,
    this.personId,
    this.createdAt,
    this.updatedAt,
    this.categorydeatils,
    this.persondeatils,
  });

  factory GiftReceiverData.fromJson(Map<String, dynamic> json) => GiftReceiverData(
    id: json["id"],
    eventId: json["event_id"],
    userId: json["user_id"],
    name: json["name"],
    image: json["image"],
    categoryId: json["category_id"],
    personId: json["person_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    categorydeatils: json["categorydeatils"] == null ? null : Deatils.fromJson(json["categorydeatils"]),
    persondeatils: json["persondeatils"] == null ? null : Deatils.fromJson(json["persondeatils"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "event_id": eventId,
    "user_id": userId,
    "name": name,
    "image": image,
    "category_id": categoryId,
    "person_id": personId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "categorydeatils": categorydeatils?.toJson(),
    "persondeatils": persondeatils?.toJson(),
  };
}

class Deatils {
  int? id;
  String? title;

  Deatils({
    this.id,
    this.title,
  });

  factory Deatils.fromJson(Map<String, dynamic> json) => Deatils(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}
