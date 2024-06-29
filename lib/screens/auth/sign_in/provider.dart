import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gurniturerenting/models/auth_models/signin_model.dart';
import 'package:gurniturerenting/screens/routes.dart';
import 'package:gurniturerenting/utils/c_variable.dart';
import 'package:gurniturerenting/widgets/constants.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:math' as math;
import 'dart:convert';
import 'package:crypto/crypto.dart';

class SignInProvider extends ChangeNotifier {
  bool isVisible = true;

  passIsVisible() {
    isVisible = !isVisible;
    notifyListeners();
  }

  void signInM() async {
    final _auth = FirebaseAuth.instance;

    if (VariableUtilities.globalFormKeys.formKeySignIn.currentState!.validate()) {
      try {
        String? token = await FirebaseMessaging.instance.getToken();

        // Sign in the user with email and password
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: TextEditingControllerVariables.emailTextEditingControllerSignIn.text,
          password: TextEditingControllerVariables.passTextEditingControllerSignIn.text,
        );

        // Update FCM token and device type in the database
        await FirebaseDatabase.instance.ref('users/${userCredential.user!.uid}').update({
          'deviceType': Platform.isIOS ? "IOS" : "ANDROID",
          'fcmToken': token!,
        });

        // Save the login token (optional, depending on your app's needs)
        // You can use Firebase Authentication token or create a custom token
        String? idToken = await userCredential.user?.getIdToken();
        VariableUtilities.prefs.write(VariableUtilities.loginToken, idToken);

        // Reset the form
        VariableUtilities.globalFormKeys.formKeySignIn.currentState!.reset();

        // Navigate to the main page
        Navigator.pushNamedAndRemoveUntil(navigatorKey.currentContext!,
            AppRouter.bottomNavigationPage, (route) => false);

        customToastShow("Sign in successful.");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          customToastShow('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          customToastShow('Wrong password provided for that user.');
        } else {
          customToastShow('Sign in failed. Please try again.');
        }
      } catch (e) {
        customToastShow('An error occurred. Please try again $e.');
        loggerPrint(print: "$e");
      }
    }
  }

  socialLogout() {}

  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }


}
