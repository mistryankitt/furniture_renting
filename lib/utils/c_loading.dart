import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gurniturerenting/generated/assets.dart';
import 'package:gurniturerenting/utils/c_variable.dart';

import 'package:lottie/lottie.dart';

postApiLoading(bool isHideDialog) {
  return isHideDialog
      ? Navigator.pop(navigatorKey.currentContext!)
      : showDialog(
          context: navigatorKey.currentState!.context,
          barrierColor: Colors.white70,
          builder: (BuildContext context) {
            return Center(
              child: LottieBuilder.asset(
                Assets.animeLoadingFr,
                height: 100.h,
                width: 100.w,
                fit: BoxFit.cover,
              ),
            );
          });
}

customLoading() => Center(
      child: Lottie.asset(Assets.animeLoadingFr, height: 100,width: 100),
    );
