import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gurniturerenting/models/auth_models/signup_model.dart';
import 'package:gurniturerenting/screens/routes.dart';
import 'package:gurniturerenting/utils/c_variable.dart';
import 'package:gurniturerenting/widgets/constants.dart';


class SignUpProvider extends ChangeNotifier {
  bool isVisible = true;


  passIsVisible() {
    isVisible = !isVisible;
    notifyListeners();
  }
  void signUpM() async {
    final _auth = FirebaseAuth.instance;

    if (VariableUtilities.globalFormKeys.formKeySignUp.currentState!.validate()) {
        FirebaseMessaging.instance.getToken().then((token) async {
          try {
            // Create a new user with email and password
            UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
              email: TextEditingControllerVariables.emailTextEditingControllerSignup.text,
              password: TextEditingControllerVariables.passTextEditingController.text,
            );

            // Update the user profile with additional information
            await userCredential.user!.updateDisplayName(
              '${TextEditingControllerVariables.firstNameTextEditingController.text} ${TextEditingControllerVariables.lastNameTextEditingController.text}',
            );

            // Save additional user data in the Realtime Database or Firestore
            await FirebaseDatabase.instance.ref('users/${userCredential.user!.uid}').set({
              'firstName': TextEditingControllerVariables.firstNameTextEditingController.text,
              'lastName': TextEditingControllerVariables.lastNameTextEditingController.text,
              'phoneNumber': TextEditingControllerVariables.phoneNumberTextEditingController.text,
              'email': TextEditingControllerVariables.emailTextEditingControllerSignup.text,
              'deviceType': Platform.isIOS ? "IOS" : "ANDROID",
              'fcmToken': token!,
            });
            Navigator.pushNamedAndRemoveUntil(navigatorKey.currentContext!,
                AppRouter.bottomNavigationPage, (route) => false);

            customToastShow("Sign up successful. Please verify your email.");
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              customToastShow('The password provided is too weak.');
            } else if (e.code == 'email-already-in-use') {
              customToastShow('The account already exists for that email.');
            }
          } catch (e) {
            customToastShow('An error occurred. Please try again.');
          }
        });

    }
  }


}
