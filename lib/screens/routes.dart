
import 'package:flutter/material.dart';
import 'package:gurniturerenting/screens/auth/sign_in/signin_page.dart';
import 'package:gurniturerenting/screens/auth/sign_up/signup_page.dart';
import 'package:gurniturerenting/screens/auth/signin_signup_page.dart';
import 'package:gurniturerenting/screens/dashboard/bottom/bottom_nav/view.dart';
import 'package:gurniturerenting/screens/dashboard/home/detailsPage.dart';
import 'package:gurniturerenting/screens/splash.dart';

class AppRouter {
  static const String splashRoute = "/";
  static const String signInSignUpPage = "signInSignUpScreen";
  static const String signInScreen = "signInScreen";
  static const String signUpPage = "SignUpPage";
  static const String forgotPasswordPage = "forgotPasswordPage";
  static const String otpVerificationPage = "otpVerificationPage";
  static const String changePasswordPage = "changePasswordPage";
  static const String accountChangePasswordPage = "accountChangePasswordPage";
  static const String bottomNavigationPage = "bottomNavigationPage";
  static const String createEventPage = "createEventPage";
  static const String editEventPage = "editEventPage";
  static const String addGiftReceiverPage = "addGiftReceiverPage";
  static const String giftReceiverDetailPage = "giftReceiverDetailPage";
  static const String giftDetailPage = "giftDetailPage";
  static const String addGiftPage = "addGiftPage";
  static const String editGiftPage = "editGiftPage";
  static const String historyPage = "historyPage";
  static const String myAccountPage = "myAccountPage";
  static const String myProfilePage = "myProfilePage";
  static const String editProfilePage = "editProfilePage";
  static const String accountSettingPage = "accountSettingPage";
  static const String shareApplicationPage = "shareApplicationPage";
  static const String termsAndConditionPage = "termsAndConditionPage";

  static const String notificationPage = "notificationPage";
  static const String detailsPage = "detailsPage";

  static const String editGiftReceiverPage = "editGiftReceiverPage";

  static const String historyFilteredPage = "historyFilteredPage";

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());
   case signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInPage());
   case signUpPage:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
   case signInSignUpPage:
        return MaterialPageRoute(builder: (_) => const SignUpSignInPage());
        case bottomNavigationPage:
        return MaterialPageRoute(builder: (_) =>  BottomNavigationPage());

      case detailsPage:
        return MaterialPageRoute(
            builder: (_) => DetailsPage(
              furnitureListing: settings.arguments.toString(),

            ));

    }
    return null;
  }
}