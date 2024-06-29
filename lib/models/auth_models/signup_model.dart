// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  SignUpData? data;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: json["data"] == null ? null : SignUpData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": data?.toJson(),
  };
}

class SignUpData {
  SignUpData({
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

  factory SignUpData.fromJson(Map<String, dynamic> json) => SignUpData(
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



SignUpRequestModel signUpRequestModelFromJson(String str) => SignUpRequestModel.fromJson(json.decode(str));

String signUpRequestModelToJson(SignUpRequestModel data) => json.encode(data.toJson());

class SignUpRequestModel {
  SignUpRequestModel({
    required this.firstname,
    required this.lastname,
    required this.phonenumber,
    required this.email,
    required this.otp,
    required this.deviceType,
    required this.fcmToken,
    required this.password,
  });

  String firstname;
  String lastname;
  String phonenumber;
  String email;
  String otp;
  String deviceType;
  String fcmToken;
  String password;

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) => SignUpRequestModel(
    firstname: json["firstname"],
    lastname: json["lastname"],
    phonenumber: json["phonenumber"],
    email: json["email"],
    otp: json["otp"],
    deviceType: json["device_type"],
    fcmToken: json["fcm_token"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "phonenumber": phonenumber,
    "email": email,
    "otp": otp,
    "device_type": deviceType,
    "fcm_token": fcmToken,
    "password": password,
  };
}
