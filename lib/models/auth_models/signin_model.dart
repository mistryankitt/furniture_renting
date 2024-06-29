// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  SignInModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  Data? data;

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
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
    deviceType: json["device_type"],
    status: json["status"],
    isNotify: json["is_notify"],
    isEmail: json["is_email"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
    "device_type": deviceType,
    "status": status,
    "is_notify": isNotify,
    "is_email": isEmail,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}


// To parse this JSON data, do
//
//     final signInRequestModel = signInRequestModelFromJson(jsonString);


SignInRequestModel signInRequestModelFromJson(String str) => SignInRequestModel.fromJson(json.decode(str));

String signInRequestModelToJson(SignInRequestModel data) => json.encode(data.toJson());

class SignInRequestModel {
  SignInRequestModel({
    required this.email,
    required this.deviceType,
    required this.fcmToken,
    required this.password,
  });

  String email;
  String deviceType;
  String fcmToken;
  String password;

  factory SignInRequestModel.fromJson(Map<String, dynamic> json) => SignInRequestModel(
    email: json["email"],
    deviceType: json["device_type"],
    fcmToken: json["fcm_token"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "device_type": deviceType,
    "fcm_token": fcmToken,
    "password": password,
  };
}
