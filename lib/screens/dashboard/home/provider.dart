import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gurniturerenting/generated/assets.dart';
import 'package:gurniturerenting/models/dashboard_models/home_models/furniture_list_model.dart';
import 'package:gurniturerenting/utils/c_variable.dart';

class HomeProvider extends ChangeNotifier {
  var furnitureList = {
    "furniture_listings": [
      {
        "id": 1,
        "name": "Module3_PEI_50 Desk",
        "description":
            "A sturdy and functional Module3_PEI_50 Desk, ideal for office and study environments.",
        "rental_price_per_month": 75.00,
        "availability_status": "available",
        "image_url": "${Assets.modelsModule3Pei50Desk}"
      },
      {
        "id": 2,
        "name": "Table School office",
        "description":
            "A sleek Table School office that can comfortably accommodate up to six people for meetings or meals.",
        "rental_price_per_month": 50.00,
        "availability_status": "available",
        "image_url": "${Assets.modelsTableSchoolOffice7Mb}"
      },
      {
        "id": 3,
        "name": "Japan School Desk",
        "description":
            "An ergonomic Japan School Desk designed for student comfort and focus during study sessions.",
        "rental_price_per_month": 30.00,
        "availability_status": "unavailable",
        "image_url": "${Assets.modelsJapanSchoolDesk}"
      },
      {
        "id": 4,
        "name": "Wooden recliner chair",
        "description":
            "A luxurious Wooden recliner chair providing exceptional comfort with its sturdy frame and soft mattress.",
        "rental_price_per_month": 90.00,
        "availability_status": "available",
        "image_url": "${Assets.modelsWoodenReclinerChair}"
      },
      {
        "id": 5,
        "name": "Bookshelf",
        "description":
            "A spacious Bookshelf offering multiple compartments for organized storage of books and decorative items.",
        "rental_price_per_month": 25.00,
        "availability_status": "available",
        "image_url": "${Assets.modelsBookshelf}"
      },
      {
        "id": 6,
        "name": "Modern Sofa",
        "description":
            "A comfortable Modern Sofa with plush cushions and a stylish design, perfect for relaxing at home.",
        "rental_price_per_month": 75.00,
        "availability_status": "available",
        "image_url": "${Assets.modelsModernSofa}"
      },
      {
        "id": 7,
        "name": "Dining Table",
        "description":
            "A modern Dining Table designed to enhance your dining experience, comfortably seating up to six people.",
        "rental_price_per_month": 50.00,
        "availability_status": "available",
        "image_url": "${Assets.modelsSimpleDiningTable}"
      },
      {
        "id": 8,
        "name": "Office Chair",
        "description":
            "An ergonomic Office Chair with adjustable height and lumbar support, ideal for long hours of work.",
        "rental_price_per_month": 30.00,
        "availability_status": "unavailable",
        "image_url": "${Assets.modelsOfficeChair}"
      },
      {
        "id": 9,
        "name": "Queen Bed",
        "description":
            "A luxurious Queen Bed offering exceptional comfort with its sturdy frame and soft mattress, ensuring a good night's sleep.",
        "rental_price_per_month": 90.00,
        "availability_status": "available",
        "image_url": "${Assets.modelsQueenSizedBed}"
      }
    ]
  };

  FurnitureListModel? furnitureListModel;

  Future<void> fetchFurnitureItems() async {
    furnitureListModel = null;
    await Future.delayed(Duration(seconds: 2)).then((value) {
      furnitureListModel = FurnitureListModel.fromJson(furnitureList);
    });
    notifyListeners();
  }

  FurnitureListing? furnitureListingM;

  // Method to set model data from JSON string
  void setModeldata(String? furnitureListingJson) {
    if (furnitureListingJson == null) return;

    var ii = json.decode(furnitureListingJson);

    // Assuming ii is a Map, parse the JSON data into your model
    furnitureListingM = FurnitureListing(
      id: ii["id"],
      imageUrl: ii["imageUrl"],
      availabilityStatus: ii["availabilityStatus"],
      name: ii["name"],
      description: ii["description"],
      rentalPricePerMonth: ii["rentalPricePerMonth"],
    );

    // Notify listeners to update the UI
    notifyListeners();
  }
}
