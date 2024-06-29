import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gurniturerenting/generated/assets.dart';
import 'package:gurniturerenting/screens/dashboard/my_account/provider.dart';
import 'package:gurniturerenting/screens/routes.dart';
import 'package:gurniturerenting/widgets/c_appbar.dart';
import 'package:gurniturerenting/widgets/c_text.dart';
import 'package:gurniturerenting/widgets/constants.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';


class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<MyAccountProvider>();

    return Scaffold(
      appBar: CDashboardAppBar(
        title: "My Account",
        backButtonVisible: false,
        action: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.notificationPage);
            },
            icon: SvgPicture.asset(Assets.iconsNotification)),
      ),
      body: CustomPaddingAllScreen(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 70.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.myProfilePage);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      minLeadingWidth: 0,
                      leading: SvgPicture.asset(
                        Assets.iconsAccount,
                        height: 20,
                        color: Colors.black,
                      ),
                      title: const CNORMALText(text: "My Profile"),
                      trailing: SvgPicture.asset(
                        Assets.iconsRightAerrow,
                        height: 15,
                      ),
                    ),
                  ),
                ),

                lineDivider,
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.shareApplicationPage);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      minLeadingWidth: 0,
                      leading: SvgPicture.asset(
                        Assets.iconsShare,
                        height: 20,
                        color: Colors.black,
                      ),
                      title: const CNORMALText(text: "Share the app"),
                      trailing: SvgPicture.asset(
                        Assets.iconsRightAerrow,
                        height: 15,
                      ),
                    ),
                  ),
                ),
                lineDivider,
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.termsAndConditionPage);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      minLeadingWidth: 0,
                      leading: SvgPicture.asset(
                        Assets.iconsTerms,
                        height: 20,
                        color: Colors.black,
                      ),
                      title: const CNORMALText(text: "Rental History"),
                      trailing: SvgPicture.asset(
                        Assets.iconsRightAerrow,
                        height: 15,
                      ),
                    ),
                  ),
                ),
                lineDivider,
                10.heightBox,
                Center(
                  child: ActionChip(
                    disabledColor: Colors.transparent,
                    onPressed: () {
                      provider.logoutM();
                    },
                    label: const CSemiBoldText(
                      text: "Logout",
                      color: Colors.redAccent,
                      minFontSize: 14,
                    ),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
