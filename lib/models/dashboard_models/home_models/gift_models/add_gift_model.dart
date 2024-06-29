// To parse this JSON data, do
//
//     final addGiftRequestModel = addGiftRequestModelFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

AddGiftRequestModel addGiftRequestModelFromJson(String str) =>
    AddGiftRequestModel.fromJson(json.decode(str));

String addGiftRequestModelToJson(AddGiftRequestModel data) =>
    json.encode(data.toJson());

class AddGiftRequestModel {
  AddGiftRequestModel(
      {required this.name,
      required this.reminer,
      this.giftstatus,
      required this.cost,
      required this.eventId,
      this.giftRecevierId,
      required this.about,
      required this.giftLink1,
      required this.giftLink2,
      required this.giftLink3,
       this.image,
      this.id});

  String name;
  List<String>? reminer;
  String? giftstatus;
  String cost;
  String eventId;
  String? giftRecevierId;
  String about;
  String giftLink1;
  String giftLink2;
  String giftLink3;
  String? image;
  String? id;

  factory AddGiftRequestModel.fromJson(Map<String, dynamic> json) =>
      AddGiftRequestModel(
          name: json["name"],
          reminer: json["reminer"] == null
              ? []
              : List<String>.from(json["reminer"]!.map((x) => x)),
          giftstatus: json["giftstatus"],
          cost: json["cost"],
          eventId: json["event_id"],
          giftRecevierId: json["gift_recevier_id"],
          about: json["about"],
          giftLink1: json["gift_link1"],
          giftLink2: json["gift_link2"],
          giftLink3: json["gift_link3"],
          image: json["image"],
          id: json["id"]);

  Map<String, String> toJson() => {
        "name": name,
        "reminer": reminer == null
            ? [].toString()
            : List<dynamic>.from(reminer!.map((x) => x)).toString(),
        "giftstatus": giftstatus ?? "",
        "cost": cost,
        "event_id": eventId,
        "gift_recevier_id": giftRecevierId!,
        "about": about,
        "gift_link1": giftLink1,
        "gift_link2": giftLink2,
        "gift_link3": giftLink3,
        "image": image.toString(),
        "id": id ?? "",
      };
}

AddGiftResponseModel addGiftResponseModelFromJson(String str) =>
    AddGiftResponseModel.fromJson(json.decode(str));

String addGiftResponseModelToJson(AddGiftResponseModel data) =>
    json.encode(data.toJson());

class AddGiftResponseModel {
  AddGiftResponseModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  Data? data;

  factory AddGiftResponseModel.fromJson(Map<String, dynamic> json) =>
      AddGiftResponseModel(
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
    this.remindme,
    this.userId,
    this.giftstatus,
    this.giftRecevierId,
    this.eventId,
    this.cost,
    this.about,
    this.giftLink1,
    this.giftLink2,
    this.giftLink3,
    this.image,
    this.id,
  });

  String? name;
  String? remindme;
  int? userId;
  String? giftstatus;
  String? giftRecevierId;
  String? eventId;
  String? cost;
  String? about;
  String? giftLink1;
  String? giftLink2;
  String? giftLink3;
  String? image;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        remindme: json["remindme"],
        userId: json["user_id"],
        giftstatus: json["giftstatus"],
        giftRecevierId: json["gift_recevier_id"],
        eventId: json["event_id"],
        cost: json["cost"],
        about: json["about"],
        giftLink1: json["gift_link1"],
        giftLink2: json["gift_link2"],
        giftLink3: json["gift_link3"],
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "remindme": remindme,
        "user_id": userId,
        "giftstatus": giftstatus,
        "gift_recevier_id": giftRecevierId,
        "event_id": eventId,
        "cost": cost,
        "about": about,
        "gift_link1": giftLink1,
        "gift_link2": giftLink2,
        "gift_link3": giftLink3,
        "image": image,
        "id": id,
      };
}
