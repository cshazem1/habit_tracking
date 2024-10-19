import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracking/features/home/presentation/screens/home_view.dart';
import 'package:habit_tracking/features/timer/presentation/timer_views.dart';

import 'app_routes.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) {
          switch (settings.name) {
            case AppRoutes.splash:
              return const OnboardinView();
            case AppRoutes.home:
              return const HomeView()
            case AppRoutes.timer:
              Map? arguments = settings.arguments as Map;
              return TimerViews(
                  habit: arguments['habit'], index: arguments['index']);
            case AppRoutes.newHabitView:
              if(settings.arguments!=null){
                Map? habits = settings.arguments as Map;
                print(settings.arguments);

                return  NewHabitView(habits:habits['habit'],index:habits['index']);

              }
              return  const NewHabitView();
            default:
              return const HomeView();
          }
        },
        settings: settings);
  }
}