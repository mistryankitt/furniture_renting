import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gurniturerenting/widgets/c_text.dart';


enum SnackType {
  error,
  warning,
  success,
}

showMySnackBar({
  required String title,
  required String message,
  SnackType type = SnackType.success,
}) {
  Get.showSnackbar(
    GetSnackBar(
      isDismissible: true,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      titleText: CSemiBoldText(text: title,color: Colors.white,),
      boxShadows: [
        BoxShadow(
            color: Colors.black.withOpacity(0.6),
            spreadRadius: 10,
            blurRadius: 50)
      ],
      borderRadius: 14,
      messageText: CNORMALText(text: message, color: Colors.white,),
      duration: const Duration(
        seconds: 1,
      ),
      animationDuration: const Duration(
        milliseconds: 500,
      ),
      barBlur: 5,
      snackPosition: SnackPosition.TOP,
      dismissDirection: DismissDirection.startToEnd,
      backgroundGradient: LinearGradient(
        colors: type == SnackType.success
            ? [
                Colors.green.withOpacity(0.8),
                Colors.green.withOpacity(0.8),
              ]
            : type == SnackType.error
                ? [
                    Colors.red,
                    Colors.redAccent,
                  ]
                : [Colors.red, Colors.redAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  );
}
