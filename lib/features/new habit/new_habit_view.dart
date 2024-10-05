

import 'package:flutter/material.dart';
import 'package:habit_tracking/core/utlis/styles.dart';
import 'package:habit_tracking/features/new%20habit/presentation/widgets/add_habit.dart';

class NewHabitView extends StatelessWidget {
  const NewHabitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:  const Text('Create custom habit' , style: Styles.textSemiBold16,),
          centerTitle: true,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      ),
      body:  const CreateCustomHabit(),

    );
  }
}
