import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gurniturerenting/generated/assets.dart';
import 'package:gurniturerenting/screens/dashboard/home/view.dart';
import 'package:gurniturerenting/screens/dashboard/my_account/view.dart';
import 'package:gurniturerenting/screens/dashboard/my_cart/view.dart';
import 'package:gurniturerenting/widgets/c_text.dart';
import 'package:gurniturerenting/widgets/constants.dart';

import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class BottomNavigationPage extends StatefulWidget {
  String? viewEvent;

  BottomNavigationPage({Key? key, this.viewEvent}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();

  //LoggedInOtherDevice loggedInOtherDevice = LoggedInOtherDevice();
  int selectedIndex = 0;
  String? signUpUserToken;

//  String? eventCode;

  @override
  void initState() {
    // checkSignUpUser();
    super.initState();

    //viewEvent = pref!.getString("viewEvent")!;
    //  log(widget.viewEvent!);
    // setState(() {
    //   CheckConnection().checkConnection(context);
    //   LoggedInOtherDevice().checkToken(context);
    // });
  }

  // Future checkSignUpUser() async {
  //   // final prefs = await SharedPreferences.getInstance();
  //   // setState(() {
  //   //   signUpUserToken = prefs.getString('login_token');
  //   //   //  eventCode = prefs.getString('event_code');
  //   // });
  // }

/*
  @override
  void dispose() {
    CheckConnection().listener.cancel();
    super.dispose();
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: PageStorage(bucket: bucket, child: currentScreen),
      bottomSheet: Container(
        height: 75,
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: inputGrayBorder)),
          color: Colors.white,
          // border: Border.all(color: gray.withOpacity(0.6), width: 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  currentScreen =  HomePage();
                  selectedIndex = 0;
                });
              },
              // tooltip: "Account",
              // iconSize: 25.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    Assets.iconsHome,
                    height: 25.sp,
                    color: selectedIndex == 0 ? primary : inputGrayText,
                  ),
                  CSemiBoldText(
                    text: "Home",
                    color: selectedIndex == 0 ? primary : inputGrayText,
                  )
                ],
              ),
            ),
            50.w.widthBox,
            InkWell(
              onTap: () {
                setState(() {
                  currentScreen =  MyCartPage();
                  selectedIndex = 1;
                });
              },
              // tooltip: "Account",
              // iconSize: 25.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    Assets.iconsHistory,
                    height: 25.sp,
                    color: selectedIndex == 1 ? primary : inputGrayText,
                  ),
                  CSemiBoldText(
                    text: "Cart",
                    color: selectedIndex == 1 ? primary : inputGrayText,
                  )
                ],
              ),
            ),
            50.w.widthBox,
            InkWell(
              onTap: () {
                setState(() {
                  currentScreen = MyAccountPage();
                  selectedIndex = 2;
                });
              },
              // tooltip: "Account",
              // iconSize: 25.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    Assets.iconsAccount,
                    height: 25.sp,
                    color: selectedIndex == 2 ? primary : inputGrayText,
                  ),
                  CSemiBoldText(
                    text: "Account",
                    color: selectedIndex == 2 ? primary : inputGrayText,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
