import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gurniturerenting/screens/auth/signin_signup_page.dart';
import 'package:gurniturerenting/screens/routes.dart';
import 'package:gurniturerenting/utils/c_variable.dart';


class SplashProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void _checkUserLoggedIn() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.pushReplacementNamed(navigatorKey.currentContext!, AppRouter.signInSignUpPage);
      } else {
        Navigator.pushReplacementNamed(navigatorKey.currentContext!, AppRouter.bottomNavigationPage);
      }
    });
  }
  /// splash screen to navigate on Boarding screen
  loadSplashScreen() {
    Timer(const Duration(seconds: 2), () async {
      if (scaffoldKey.currentContext != null) {
        _checkUserLoggedIn();
      }
    });
  }

  ///=============================================================================================================///
  int currentIndex = 0;
  late PageController pageController;

  updateCurrentIndex(value) {
    currentIndex = value;
    notifyListeners();
  }
}
