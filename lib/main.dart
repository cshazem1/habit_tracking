import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:habit_tracking/features/notification/notification_view.dart';
import 'package:habit_tracking/features/onboarding/presentation/onboardin_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/routes/app_router.dart';

var initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen= await preferences.getInt("initScreen");
  await preferences.setInt("initScreen", 1);


  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (BuildContext context) {
      return MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get intiScreen => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      // ScreenUtilInit(
      //   designSize: const Size(375, 812),
        GetMaterialApp(
          onGenerateRoute: AppRouter.onGenerateRoute,
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          // home: const OnboardinView(),
          initialRoute: intiScreen == 0 || initScreen == null ?"onboard": "home",
          routes: {
            "home" : (context) => const NotificationView(),
            "onboard": (context) => const OnboardinView(),
          },
        );
  }
}
