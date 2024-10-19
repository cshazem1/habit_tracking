import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:habit_tracking/features/home/presentation/screens/home_view.dart';
import 'package:habit_tracking/features/navigation/main_navigation_page.dart';
import 'package:habit_tracking/features/new%20habit/Data/model/habit_view_model.dart';
import 'package:habit_tracking/features/new%20habit/Data/model/habits_model.dart';
import 'package:habit_tracking/features/progress/presentation/controller/weekly_progress_cubit.dart'; // Import WeeklyProgressCubit
import 'package:habit_tracking/features/timer/presentation/manager/timer_cubit/timer_cubit.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'core/routes/app_router.dart';
import 'features/home/presentation/manager/home_cubit.dart';
import 'features/new habit/Data/model/habits_final_model.dart';
import 'features/progress/presentation/controller/monthly_cubit.dart';
import 'features/progress/presentation/controller/yearly_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


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
                ..selectDate(DateTime.now()),
            ),
            BlocProvider(
              create: (context) => TimerCubit(),
            ),
              BlocProvider(create: (context) => WeeklyProgressCubit()),
              BlocProvider(create: (context) => MonthlyProgressCubit(context.read<HomeCubit>())),
              BlocProvider(create: (context) => YearlyProgressCubit(context.read<HomeCubit>())),// Provide WeeklyProgressCubit here
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
