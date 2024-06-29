import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gurniturerenting/firebase_options.dart';
import 'package:gurniturerenting/screens/multi_provider.dart';
import 'package:gurniturerenting/screens/routes.dart';
import 'package:gurniturerenting/utils/c_variable.dart';
import 'package:gurniturerenting/widgets/c_internet_checker_widget.dart';
import 'package:gurniturerenting/widgets/constants.dart';

void main() async {
  /// Initialize the Local Storage.
  GetStorage.init("Furniture Renting");
  // await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  ConnectionStatusSingleton connectionStatus =
  ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // LocalNotificationServices().initialize();
  // FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);

  /// gift4all Application.
  VariableUtilities.prefs;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  AppRouter appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MultiProviderApp(
            child: GetMaterialApp(
              title: 'Furniture Renting',
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  useMaterial3: true,
                  scaffoldBackgroundColor: Colors.white,
                  canvasColor: Colors.white,
                  dialogBackgroundColor: Colors.white,
                  // bottomSheetTheme: BottomSheetThemeData(
                  //   elevation: 0,
                  //     backgroundColor: Colors.black.withOpacity(0)),
                  datePickerTheme: const DatePickerThemeData(elevation: 0),
                  dialogTheme: const DialogTheme(
                    elevation: 0,
                  ),
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                    primary: primary,
                  )),
              onGenerateRoute: appRouter.onGenerateRoute,
            ),
          );
        });
  }
}


