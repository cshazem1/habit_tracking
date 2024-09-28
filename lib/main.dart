import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:habit_tracking/features/login%20screen/presentation/login_screen.dart';
import 'package:habit_tracking/features/onboarding/presentation/onboardin_view.dart';
import 'package:habit_tracking/features/register/presentation/register_view.dart';
import 'package:habit_tracking/features/starting%20page/presentation/starting_view.dart';
import 'features/timer/presentation/timer_views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: GetMaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home:  OnboardinView(),
    ););}}