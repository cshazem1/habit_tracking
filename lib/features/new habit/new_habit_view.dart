import 'package:flutter/material.dart';
import 'package:habit_tracking/core/routes/app_routes.dart';
import 'package:habit_tracking/core/utlis/styles.dart';
import 'package:habit_tracking/features/new%20habit/presentation/widgets/add_habit.dart';

import '../navigation/main_navigation_page.dart';
import 'Data/model/habits_final_model.dart';

class NewHabitView extends StatelessWidget {
  const NewHabitView({super.key,  this.habits,  this.index});
final  HabitFinalModel?  habits;

  final int ?index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create custom habit',
          style: Styles.textSemiBold24,
        ),
        centerTitle: true,
        leading:
            IconButton(onPressed: () {
              Navigator.pushNamed(context,AppRoutes.home);
            }, icon: const Icon(Icons.arrow_back)),
      ),
      body:  CreateCustomHabit(index:index,habits:habits,),
    );
  }
}
