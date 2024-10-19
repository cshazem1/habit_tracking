import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/routes/app_router.dart';
import 'features/home/presentation/manager/home_cubit.dart';
import 'features/navigation/main_navigation_page.dart';
import 'features/new habit/Data/model/habit_view_model.dart';
import 'features/new habit/Data/model/habits_final_model.dart';
import 'features/new habit/Data/model/habits_model.dart';
import 'features/timer/presentation/manager/timer_cubit/timer_cubit.dart';
import 'package:provider/provider.dart';

var initScreen;

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HabitFinalModelAdapter());
  Hive.registerAdapter(HabitsModelAdapter());
  await Hive.openBox<HabitsModel>('habits');
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen= await preferences.getInt("initScreen");
  await preferences.setInt("initScreen", 1);


  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (BuildContext context) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get intiScreen => null;

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
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.onGenerateRoute,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),

          ),
        ),
      ),
    );
  }
}
