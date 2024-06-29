import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CBOLDText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? minFontSize;

  const CBOLDText({Key? key, required this.text, this.minFontSize, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: "sfproBold",
          color: color ?? Colors.black,
          fontSize: minFontSize ?? 12,
          fontWeight: FontWeight.bold),
    );
  }
}

class CNORMALText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? minFontSize;

  const CNORMALText(
      {Key? key, required this.text, this.color, this.minFontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: "sfproRegular",
          color: color ?? Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: minFontSize ?? 15.sp),
    );
  }
}

class CSemiBoldText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? minFontSize;

  const CSemiBoldText(
      {Key? key, required this.text, this.color, this.minFontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: "sfproSemiBold",
          color: color ?? Colors.black,
          fontSize: minFontSize ?? 14.sp,
          fontWeight: FontWeight.w200),
    );
  }
}
