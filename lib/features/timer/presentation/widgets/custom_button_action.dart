import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracking/features/home/presentation/manager/home_cubit.dart';
import 'package:habit_tracking/features/progress/presentation/controller/weekly_progress_cubit.dart'; // Import WeeklyProgressCubit

import '../manager/timer_cubit/timer_cubit.dart';
import 'custom_circle_button.dart';

class CustomButtonAction extends StatelessWidget {
  const CustomButtonAction({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    // Access the WeeklyProgressCubit here
    final weeklyProgressCubit = context.read<WeeklyProgressCubit>(); // Get the WeeklyProgressCubit

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomCircleButton(
          onTap: () {
            BlocProvider.of<TimerCubit>(context).resetTimer();
          },
          icon: Icon(
            Icons.refresh,
            size: 25.w,
            color: const Color(0xff5F6CE2),
          ),
          color: const Color(0xffEBEEFF),
          size: 56.h,
        ),
        CustomCircleButton(
          onTap: () {
            BlocProvider.of<TimerCubit>(context).stopAndResetTimer();
          },
          icon: Icon(
            BlocProvider.of<TimerCubit>(context).isPlay
                ? Icons.pause_rounded
                : Icons.play_arrow_rounded,
            size: 50.w,
            color: Colors.white,
          ),
          color: const Color(0xff5F6CE2),
          size: 96.h,
        ),
        CustomCircleButton(
          onTap: () {
            // Pass the weeklyProgressCubit to checkHabit method
            // HomeCubit.get(context).checkHabit(index, weeklyProgressCubit); // Fixed line 48
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.check,
            size: 25.w,
            color: const Color(0xff5F6CE2),
          ),
          color: const Color(0xffEBEEFF),
          size: 56.h,
        ),
      ],
    );
  }
}
