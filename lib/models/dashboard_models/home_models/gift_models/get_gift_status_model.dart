// To parse this JSON data, do
//
//     final getEventNameModel = getGiftStatusModelFromJson(jsonString);

import 'dart:convert';

GetGiftStatusModel getGiftStatusModelFromJson(String str) =>
    GetGiftStatusModel.fromJson(json.decode(str));

String getGiftStatusModelToJson(GetGiftStatusModel data) =>
    json.encode(data.toJson());

class GetGiftStatusModel {
  GetGiftStatusModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  List<Datum>? data;

  factory GetGiftStatusModel.fromJson(Map<String, dynamic> json) =>
      GetGiftStatusModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
