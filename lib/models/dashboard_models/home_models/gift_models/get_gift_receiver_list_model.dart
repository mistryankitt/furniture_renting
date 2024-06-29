// To parse this JSON data, do
//
//     final getGiftReceiverListModel = getGiftReceiverListModelFromJson(jsonString);

import 'dart:convert';

GetGiftReceiverListModel getGiftReceiverListModelFromJson(String str) => GetGiftReceiverListModel.fromJson(json.decode(str));

String getGiftReceiverListModelToJson(GetGiftReceiverListModel data) => json.encode(data.toJson());

class GetGiftReceiverListModel {
  String? status;
  String? message;
  int? code;
  List<Datum>? data;

  GetGiftReceiverListModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory GetGiftReceiverListModel.fromJson(Map<String, dynamic> json) => GetGiftReceiverListModel(
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
  int? eventId;
  int? userId;
  String? image;
  String? name;
  int? categoryId;
  int? personId;
  int? giftcountCount;
  Deatils? categorydeatils;
  Deatils? persondeatils;

  Datum({
    this.id,
    this.eventId,
    this.userId,
    this.image,
    this.name,
    this.categoryId,
    this.personId,
    this.giftcountCount,
    this.categorydeatils,
    this.persondeatils,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    eventId: json["event_id"],
    userId: json["user_id"],
    image: json["image"],
    name: json["name"],
    categoryId: json["category_id"],
    personId: json["person_id"],
    giftcountCount: json["giftcount_count"],
    categorydeatils: json["categorydeatils"] == null ? null : Deatils.fromJson(json["categorydeatils"]),
    persondeatils: json["persondeatils"] == null ? null : Deatils.fromJson(json["persondeatils"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "event_id": eventId,
    "user_id": userId,
    "image": image,
    "name": name,
    "category_id": categoryId,
    "person_id": personId,
    "giftcount_count": giftcountCount,
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
