import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gurniturerenting/screens/routes.dart';
import 'package:gurniturerenting/utils/c_variable.dart';

class MyAccountProvider extends ChangeNotifier {

  void logoutM() async{
    final _auth = FirebaseAuth.instance;
    await _auth.signOut();
    Navigator.pushNamed(
        navigatorKey.currentContext!, AppRouter.signInSignUpPage);

  }

}
