import 'package:flutter/material.dart';
import 'package:habit_tracking/features/home/presentation/screens/home_view.dart';
import 'package:habit_tracking/features/timer/presentation/timer_views.dart';
import '../../features/login screen/presentation/login_screen.dart';
import '../../features/navigation/main_navigation_page.dart';
import '../../features/new habit/new_habit_view.dart';
import '../../features/onboarding/presentation/onboardin_view.dart';
import 'app_routes.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) {
          switch (settings.name) {
            case AppRoutes.splash:
              return const OnboardinView();
            case AppRoutes.login:
              return  LoginScreen();
            case AppRoutes.home:
              return  MainNavigationPage();
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