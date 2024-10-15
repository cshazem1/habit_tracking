import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracking/features/new%20habit/Data/model/habits_final_model.dart';
import 'package:habit_tracking/features/timer/presentation/manager/timer_cubit/timer_cubit.dart';

import 'package:habit_tracking/features/timer/presentation/widgets/timer_view_body.dart';

import '../../../core/utlis/styles.dart';

class TimerViews extends StatelessWidget {
  final int index;
  const TimerViews({
    required this.index,
    super.key, this.habit,
  });
final  HabitFinalModel? habit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      TimerCubit()
        ..init(maxTime: int.parse(habit?.timer??'0')*60, progress: 1)
        ,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
           Text('Meditate for ${habit?.timer} minutes', style: Styles.textSemiBold16),
        ),
        body:  TimerViewBody(habit: habit, index: index),
      ),
    );
  }
}
