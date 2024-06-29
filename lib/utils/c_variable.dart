import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

loggerPrint({bool isLoggerEnabled = true, required String print}) {
  Logger logger = Logger();
  if (isLoggerEnabled == true) {
    logger.d(print);
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class VariableUtilities {
  static final prefs = GetStorage('Furniture Renting');
  static Size? screenSize;

  ///local storage variables
  static const String isIntroSaved = "isIntroSaved";
  static const String isUserLoggedIn = "isUserLoggedIn";
  static const String loginToken = "LoginToken";

  ///APIS objects
  // static AuthAPIS authAPIS = AuthAPIS();
  // static HomeAPIS homeAPIS = HomeAPIS();
  // static AccountsAPI accountAPIS = AccountsAPI();
  // static HistoryAPI historyAPIS = HistoryAPI();

  ///global key object
  static GlobalFormKeys globalFormKeys = GlobalFormKeys();
}

//todo :- form controller
class TextEditingControllerVariables {
  ///sign up page controllers
  static TextEditingController passTextEditingController =
      TextEditingController();
  static TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  static TextEditingController firstNameTextEditingController =
      TextEditingController();
  static TextEditingController lastNameTextEditingController =
      TextEditingController();
  static TextEditingController emailTextEditingControllerSignup =
      TextEditingController();

  ///sign in page form controller
  static TextEditingController emailTextEditingControllerSignIn =
      TextEditingController();
  static TextEditingController passTextEditingControllerSignIn =
      TextEditingController();




  ///edit profile page form controllers
  static TextEditingController editFirstNameController =
      TextEditingController();
  static TextEditingController editNumberController = TextEditingController();
  static TextEditingController editDOBController = TextEditingController();
  static TextEditingController editLastNameController = TextEditingController();
  static TextEditingController editGenderNameController =
      TextEditingController();






}

class GlobalFormKeys {
  ///sign up page form key
  final GlobalKey<FormState> _formKeySignUp = GlobalKey<FormState>();

  GlobalKey<FormState> get formKeySignUp => _formKeySignUp;

  ///sign in page form key
  final GlobalKey<FormState> _formKeySignIn = GlobalKey<FormState>();

  GlobalKey<FormState> get formKeySignIn => _formKeySignIn;


  ///edit profile page form key
  final GlobalKey<FormState> _editProfileFormKey = GlobalKey<FormState>();

  GlobalKey<FormState> get editProfileFormKey => _editProfileFormKey;






}
