import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utlis/styles.dart';
import '../manager/timer_cubit/timer_cubit.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const BackGroundTimer(),
        SizedBox(
          width: 200.h,
          height: 200.h,
          child: CircularProgressIndicator(
            value: BlocProvider.of<TimerCubit>(context).progress,
            strokeWidth: 20,
            valueColor: BlocProvider.of<TimerCubit>(context).remainingTime! >
                    BlocProvider.of<TimerCubit>(context).maxTime! / 4
                ? const AlwaysStoppedAnimation<Color>(Color(0xff9AFF76))
                : const AlwaysStoppedAnimation<Color>(Colors.red),
            backgroundColor: Colors.grey[300],
          ),
        ),
        Column(
          children: [
            BlocBuilder<TimerCubit, TimerState>(
              builder: (context, state) {
                if (state is TimerSuccess) {
                  return Text(
                    state.text,
                    style: Styles.textSemiBold32,
                  );
                }
                return const SizedBox();
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "${(BlocProvider.of<TimerCubit>(context).maxTime! / 60).toString()} min",
              style: Styles.textSemiBold16.copyWith(
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BackGroundTimer extends StatelessWidget {
  const BackGroundTimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 268.w,
      height: 268.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4), // لون الظل مع التعتيم
            spreadRadius: 7, // مدى انتشار الظل
            blurRadius: 20, // درجة التمويه للظل
            offset: const Offset(0, 0), // إزاحة الظل (x,y)
          ),
        ],
      ),
    );
  }
}
