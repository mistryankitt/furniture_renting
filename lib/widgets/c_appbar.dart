import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gurniturerenting/generated/assets.dart';
import 'package:gurniturerenting/widgets/c_text.dart';
import 'package:gurniturerenting/widgets/constants.dart';

import 'package:velocity_x/velocity_x.dart';

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 80.h,
        padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
               Navigator.pop(context);
              },
              child: CircleContainer(
                  radius: 15.r,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0).r,
                    child: SvgPicture.asset(
                      Assets.iconsBack,
                    ),
                  )),
            ),
            10.w.widthBox,
            CSemiBoldText(text: title),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(70.h);
}

class CircleContainer extends StatelessWidget {
  final double radius;
  final Widget child;

  CircleContainer({Key? key, required this.radius, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Center(
        child: child,
      ),
    );
  }
}

class CDashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CDashboardAppBar(
      {Key? key, required this.title, this.backButtonVisible = true, this.action})
      : super(key: key);
  final String title;
  final bool? backButtonVisible;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0), child: Container(height: 1,color: backButtonVisible == false ? inputGrayBorder : Colors.white,)),
      automaticallyImplyLeading: false,
      backgroundColor: Vx.white,
      shadowColor: Colors.black,
      scrolledUnderElevation: 0,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              backButtonVisible == true ?  IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(Assets.iconsBack)) : SizedBox(),
              CSemiBoldText(text: title, minFontSize: 20.sp,),

            ],
          ),
          Row(
            children: [
              action ?? Container(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  Size.fromHeight(50.h);
}
