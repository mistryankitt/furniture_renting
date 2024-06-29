// To parse this JSON data, do
//
//     final furnitureListModel = furnitureListModelFromJson(jsonString);

import 'dart:convert';

FurnitureListModel furnitureListModelFromJson(String str) => FurnitureListModel.fromJson(json.decode(str));

String furnitureListModelToJson(FurnitureListModel data) => json.encode(data.toJson());

class FurnitureListModel {
  List<FurnitureListing>? furnitureListings;

  FurnitureListModel({
    this.furnitureListings,
  });

  factory FurnitureListModel.fromJson(Map<String, dynamic> json) => FurnitureListModel(
    furnitureListings: json["furniture_listings"] == null ? [] : List<FurnitureListing>.from(json["furniture_listings"]!.map((x) => FurnitureListing.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "furniture_listings": furnitureListings == null ? [] : List<dynamic>.from(furnitureListings!.map((x) => x.toJson())),
  };
}

class FurnitureListing {
  int? id;
  String? name;
  String? description;
  num? rentalPricePerMonth;
  String? availabilityStatus;
  String? imageUrl;

  FurnitureListing({
    this.id,
    this.name,
    this.description,
    this.rentalPricePerMonth,
    this.availabilityStatus,
    this.imageUrl,
  });

  factory FurnitureListing.fromJson(Map<String, dynamic> json) => FurnitureListing(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    rentalPricePerMonth: json["rental_price_per_month"],
    availabilityStatus: json["availability_status"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "rental_price_per_month": rentalPricePerMonth,
    "availability_status": availabilityStatus,
    "image_url": imageUrl,
  };
}
