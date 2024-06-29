import 'dart:convert';

EditProfileRequestModel editProfileRequestModelFromJson(String str) =>
    EditProfileRequestModel.fromJson(json.decode(str));

String editProfileRequestModelToJson(EditProfileRequestModel data) =>
    json.encode(data.toJson());

class EditProfileRequestModel {
  EditProfileRequestModel({
    required this.firstname,
    required this.lastname,
    required this.phonenumber,
    required this.dob,
    required this.gender,
  });

  String firstname;
  String lastname;
  String phonenumber;
  String dob;
  String gender;

  factory EditProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      EditProfileRequestModel(
        firstname: json["firstname"],
        lastname: json["lastname"],
        phonenumber: json["phonenumber"],
        dob: json["dob"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "phonenumber": phonenumber,
        "dob": dob,
        "gender": gender,
      };
}


EditProfileModel editProfileModelFromJson(String str) => EditProfileModel.fromJson(json.decode(str));

String editProfileModelToJson(EditProfileModel data) => json.encode(data.toJson());

class EditProfileModel {
  EditProfileModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  Data? data;

  factory EditProfileModel.fromJson(Map<String, dynamic> json) => EditProfileModel(
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
  DateTime? dob;
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
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
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
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "otp": otp,
    "firstname": firstname,
    "lastname": lastname,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
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
