import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracking/features/home/presentation/screens/home_view.dart';
import 'package:habit_tracking/features/onboarding/presentation/onboardin_view.dart';
import 'package:habit_tracking/features/progress/presentation/progress_view.dart';
import 'package:habit_tracking/features/setting/presentation/setting_view.dart';
import 'package:habit_tracking/features/starting%20page/presentation/starting_view.dart';
import 'package:habit_tracking/features/timer/presentation/timer_views.dart';

import 'app_routes.dart';

class AppRouter {
static Route onGenerateRoute(RouteSettings settings) {
  return MaterialPageRoute(builder: (context) {
     switch (settings.name) {
    case AppRoutes.splash:
    return const OnboardinView();
    case AppRoutes.timer:
    return const TimerViews();
    default:
    return const HomeView();
    }
  },settings: settings);
}



}