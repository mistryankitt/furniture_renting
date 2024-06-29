import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gurniturerenting/widgets/constants.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final bool isBorder;
  final bool isBorderColor;

  final bool isIcon;
  final String? iconString;

  const CustomButtonWidget(
      {Key? key,
      required this.text,
      required this.onTap,
      this.color,
      this.isBorder = false,
      this.isIcon = false,
      this.isBorderColor = false,
      this.iconString,
      this.borderColor,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    HapticFeedback.selectionClick();
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: isBorder
            ? BorderSide(
                color: isBorderColor ? borderColor! : Vx.gray300, width: 1)
            : const BorderSide(color: primary, width: 0),
      ),
      color: color ?? primary,
      //borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: onTap,
        customBorder: isBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: primary, width: 5.0))
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: primary, width: 0.0)),
        child: SizedBox(
            height: context.screenHeight / 15,
            width: context.screenWidth,
            child: isIcon
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        iconString!,
                        scale: (MediaQuery.of(context).size.height /
                                MediaQuery.of(context).size.width) *
                            4,
                      ),
                      15.h.widthBox,
                      Text(
                        text,
                        style: TextStyle(
                            color: textColor ?? Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 12.sp,
                            fontFamily: "sfpro"),
                      ).centered()
                    ],
                  )
                : Text(
                    text,
                    style: TextStyle(
                        color: textColor ?? Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        fontFamily: "sfpro"),
                  ).centered()),
      ),
    );
  }
}
