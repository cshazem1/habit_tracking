import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:habit_tracking/core/utlis/constants.dart';
import 'package:habit_tracking/features/new%20habit/new_habit_view.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/routes/app_router.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox(kHabitsBox);
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (BuildContext context) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        child: GetMaterialApp(
          onGenerateRoute: AppRouter.onGenerateRoute,
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const NewHabitView(),

        ),
        );
  }
}
