import 'package:flutter/material.dart';
import 'package:gurniturerenting/screens/auth/sign_in/provider.dart';
import 'package:gurniturerenting/screens/auth/sign_up/provider.dart';
import 'package:gurniturerenting/screens/dashboard/bottom/bottom_nav/provider.dart';
import 'package:gurniturerenting/screens/dashboard/home/provider.dart';
import 'package:gurniturerenting/screens/dashboard/my_account/provider.dart';
import 'package:gurniturerenting/screens/dashboard/my_cart/provider.dart';
import 'package:gurniturerenting/screens/splash_provider.dart';

import 'package:provider/provider.dart';

class MultiProviderApp extends StatelessWidget {
  final Widget child;

  const MultiProviderApp({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashProvider>(
            create: (BuildContext context) => SplashProvider()),
        ChangeNotifierProvider<SignUpProvider>(
            create: (BuildContext context) => SignUpProvider()),
        ChangeNotifierProvider<SignInProvider>(
            create: (BuildContext context) => SignInProvider()),
        ChangeNotifierProvider<BottomNavProvider>(
            create: (BuildContext context) => BottomNavProvider()),
        ChangeNotifierProvider<HomeProvider>(
            create: (BuildContext context) => HomeProvider()),
        ChangeNotifierProvider<MyCartProvider>(
            create: (BuildContext context) => MyCartProvider()),
        ChangeNotifierProvider<MyAccountProvider>(
            create: (BuildContext context) => MyAccountProvider()),
      ],
      child: child,
    );
  }
}
