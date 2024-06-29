// To parse this JSON data, do
//
//     final getUserProfileModel = getUserProfileModelFromJson(jsonString);

import 'dart:convert';

GetUserProfileModel getUserProfileModelFromJson(String str) =>
    GetUserProfileModel.fromJson(json.decode(str));

String getUserProfileModelToJson(GetUserProfileModel data) =>
    json.encode(data.toJson());

class GetUserProfileModel {
  GetUserProfileModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  Data? data;

  factory GetUserProfileModel.fromJson(Map<String, dynamic> json) =>
      GetUserProfileModel(
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
    this.id,
    this.otp,
    this.firstname,
    this.lastname,
    this.dob,
    this.phonenumber,
    this.apiToken,
    this.email,
    this.gender,
    this.emailVerifiedAt,
    this.fcmToken,
    this.facebookId,
    this.googleId,
    this.appId,
    this.deviceType,
    this.status,
    this.isNotify,
    this.isEmail,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? otp;
  String? firstname;
  String? lastname;
  dynamic dob;
  String? phonenumber;
  String? apiToken;
  String? email;
  String? gender;
  dynamic emailVerifiedAt;
  String? fcmToken;
  String? facebookId;
  String? googleId;
  String? appId;
  String? deviceType;
  int? status;
  int? isNotify;
  int? isEmail;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        otp: json["otp"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        dob: json["dob"],
        phonenumber: json["phonenumber"],
        apiToken: json["api_token"],
        email: json["email"],
        gender: json["gender"],
        emailVerifiedAt: json["email_verified_at"],
        fcmToken: json["fcm_token"],
        facebookId: json["facebook_id"],
        googleId: json["google_id"],
        appId: json["app_id"],
        deviceType: json["device_type"],
        status: json["status"],
        isNotify: json["is_notify"],
        isEmail: json["is_email"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "otp": otp,
        "firstname": firstname,
        "lastname": lastname,
        "dob": dob,
        "phonenumber": phonenumber,
        "api_token": apiToken,
        "email": email,
        "gender": gender,
        "email_verified_at": emailVerifiedAt,
        "fcm_token": fcmToken,
        "facebook_id": facebookId,
        "google_id": googleId,
        "app_id": appId,
        "device_type": deviceType,
        "status": status,
        "is_notify": isNotify,
        "is_email": isEmail,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
