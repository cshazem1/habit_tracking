import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracking/features/new%20habit/Data/model/habit_view_model.dart';
import 'package:habit_tracking/features/new%20habit/Data/model/habits_model.dart';
import 'package:habit_tracking/features/timer/presentation/manager/timer_cubit/timer_cubit.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'core/routes/app_router.dart';
import 'features/home/presentation/manager/home_cubit.dart';
import 'features/navigation/main_navigation_page.dart';
import 'features/new habit/Data/model/habits_final_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HabitFinalModelAdapter());
  Hive.registerAdapter(HabitsModelAdapter());
  await Hive.openBox<HabitsModel>('habits');

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
    return ChangeNotifierProvider(
      create: (context) => HabitViewModel(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeCubit()
                ..selectDate(DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day)),
            ),
            BlocProvider(
              create: (context) => TimerCubit(),
            ),

          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.onGenerateRoute,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: MainNavigationPage(),

          ),
        ),
      ),
    );
  }
}