import 'package:flutter/material.dart';
import 'package:habit_tracking/features/home/presentation/screens/home_view.dart';
import 'package:habit_tracking/features/new%20habit/new_habit_view.dart';
import 'package:habit_tracking/features/onboarding/presentation/onboardin_view.dart';
import 'package:habit_tracking/features/timer/presentation/timer_views.dart';

import 'app_routes.dart';

class AppRouter {
static Route onGenerateRoute(RouteSettings settings) {
  return MaterialPageRoute(builder: (context) {
     switch (settings.name) {
    case AppRoutes.splash:
    return   const HomeView();
    case AppRoutes.timer:
    return const TimerViews();
       case AppRoutes.newHabitView:
         return const NewHabitView();
    default:
    return const HomeView();
    }
  },settings: settings);
}



}