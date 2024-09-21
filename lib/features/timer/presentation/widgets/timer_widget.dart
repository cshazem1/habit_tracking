import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/timer_cubit/timer_cubit.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 268.w,
          height: 268.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // لون الظل مع التعتيم
                spreadRadius: 5, // مدى انتشار الظل
                blurRadius: 7, // درجة التمويه للظل
                offset: const Offset(3, 3), // إزاحة الظل (x,y)
              ),
            ],
          ),
        ),
        BlocBuilder<TimerCubit, TimerState>(
          builder: (context, state) {
            return SizedBox(
              width: 200.h,
              height: 200.h,
              child: CircularProgressIndicator(
                value: BlocProvider.of<TimerCubit>(context).progress,
                strokeWidth: 20,
                valueColor: BlocProvider.of<TimerCubit>(context).remainingTime!>BlocProvider.of<TimerCubit>(context).maxTime!/4?const AlwaysStoppedAnimation<Color>(Color(0xff9AFF76)):const AlwaysStoppedAnimation<Color>(Colors.red),
                backgroundColor: Colors.grey[300],
              ),
            );
          },
        ),
        BlocBuilder<TimerCubit, TimerState>(
          builder: (context, state) {
            if (state is TimerSuccess) {
              return Text(
                state.text,
                style:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
