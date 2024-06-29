import 'package:flutter/material.dart';
import 'package:gurniturerenting/generated/assets.dart';
import 'package:gurniturerenting/screens/routes.dart';
import 'package:gurniturerenting/widgets/c_button.dart';
import 'package:gurniturerenting/widgets/c_text.dart';
import 'package:gurniturerenting/widgets/constants.dart';

import 'package:velocity_x/velocity_x.dart';

class SignUpSignInPage extends StatelessWidget {
  const SignUpSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaddingAllScreen(
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   Assets.imagesGiftInfographic,
                  //   fit: BoxFit.contain,
                  // ),
                  20.heightBox,
                  const CSemiBoldText(text: "Lorem Ipsum is simply dummy"),
                  10.heightBox,
                  const CSemiBoldText(
                    text: "text of the printing.",
                    color: primary,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              // align children to the bottom
              children: [
                CustomButtonWidget(
                    text: "Sign Up",
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.signUpPage);
                    }),
                10.heightBox,
                CustomButtonWidget(
                  text: "Sign In",
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.signInScreen);
                  },
                  borderColor: footerGrayTab,
                  color: footerActiveTab,
                  isBorder: true,
                  textColor: blackColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
