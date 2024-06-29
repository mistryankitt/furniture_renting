// To parse this JSON data, do
//
//     final getGiftListModel = getGiftListModelFromJson(jsonString);

import 'dart:convert';

GetGiftListModel getGiftListModelFromJson(String str) => GetGiftListModel.fromJson(json.decode(str));

String getGiftListModelToJson(GetGiftListModel data) => json.encode(data.toJson());

class GetGiftListModel {
  String? status;
  String? message;
  int? code;
  List<Datum>? data;

  GetGiftListModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory GetGiftListModel.fromJson(Map<String, dynamic> json) => GetGiftListModel(
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
  int? giftRecevierId;
  String? name;
  String? image;
  int? giftstatus;
  int? cost;
  String? giftLink1;
  dynamic giftLink2;
  dynamic giftLink3;
  String? remindme;
  String? about;
  DateTime? updatedAt;
  DateTime? createdAt;
  Gifstatusdetails? gifstatusdetails;
  List<dynamic>? giftreceiptdetails;

  Datum({
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
    this.gifstatusdetails,
    this.giftreceiptdetails,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    gifstatusdetails: json["gifstatusdetails"] == null ? null : Gifstatusdetails.fromJson(json["gifstatusdetails"]),
    giftreceiptdetails: json["giftreceiptdetails"] == null ? [] : List<dynamic>.from(json["giftreceiptdetails"]!.map((x) => x)),
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
    "gifstatusdetails": gifstatusdetails?.toJson(),
    "giftreceiptdetails": giftreceiptdetails == null ? [] : List<dynamic>.from(giftreceiptdetails!.map((x) => x)),
  };
}

class Gifstatusdetails {
  int? id;
  String? title;
  String? color;

  Gifstatusdetails({
    this.id,
    this.title,
    this.color,
  });

  factory Gifstatusdetails.fromJson(Map<String, dynamic> json) => Gifstatusdetails(
    id: json["id"],
    title: json["title"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "color": color,
  };
}
