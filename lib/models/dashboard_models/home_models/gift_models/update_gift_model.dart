// To parse this JSON data, do
//
//     final editGiftResponseModel = editGiftResponseModelFromJson(jsonString);

import 'dart:convert';

EditGiftResponseModel editGiftResponseModelFromJson(String str) => EditGiftResponseModel.fromJson(json.decode(str));

String editGiftResponseModelToJson(EditGiftResponseModel data) => json.encode(data.toJson());

class EditGiftResponseModel {
  String? status;
  String? message;
  int? code;
  Data? data;

  EditGiftResponseModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory EditGiftResponseModel.fromJson(Map<String, dynamic> json) => EditGiftResponseModel(
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
  int? id;
  int? userId;
  int? eventId;
  int? giftRecevierId;
  String? name;
  String? image;
  String? giftstatus;
  String? cost;
  String? giftLink1;
  String? giftLink2;
  String? giftLink3;
  String? remindme;
  String? about;
  DateTime? updatedAt;
  DateTime? createdAt;

  Data({
    this.id,
    this.userId,
    this.eventId,
    this.giftRecevierId,
    this.name,
    this.image,
    this.giftstatus,
    this.cost,
    this.giftLink1,
    this.giftLink2,
    this.giftLink3,
    this.remindme,
    this.about,
    this.updatedAt,
    this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    userId: json["user_id"],
    eventId: json["event_id"],
    giftRecevierId: json["gift_recevier_id"],
    name: json["name"],
    image: json["image"],
    giftstatus: json["giftstatus"],
    cost: json["cost"],
    giftLink1: json["gift_link1"],
    giftLink2: json["gift_link2"],
    giftLink3: json["gift_link3"],
    remindme: json["remindme"],
    about: json["about"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "event_id": eventId,
    "gift_recevier_id": giftRecevierId,
    "name": name,
    "image": image,
    "giftstatus": giftstatus,
    "cost": cost,
    "gift_link1": giftLink1,
    "gift_link2": giftLink2,
    "gift_link3": giftLink3,
    "remindme": remindme,
    "about": about,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
  };
}
