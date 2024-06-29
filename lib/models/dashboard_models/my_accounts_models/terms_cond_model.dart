// To parse this JSON data, do
//
//     final getTermsConditionModel = getTermsConditionModelFromJson(jsonString);

import 'dart:convert';

GetTermsConditionModel getTermsConditionModelFromJson(String str) => GetTermsConditionModel.fromJson(json.decode(str));

String getTermsConditionModelToJson(GetTermsConditionModel data) => json.encode(data.toJson());

class GetTermsConditionModel {
  String? status;
  String? message;
  int? code;
  List<Datum>? data;

  GetTermsConditionModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory GetTermsConditionModel.fromJson(Map<String, dynamic> json) => GetTermsConditionModel(
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
  String? title;
  String? description;
  dynamic createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "created_at": createdAt,
    "updated_at": updatedAt?.toIso8601String(),
  };
}
