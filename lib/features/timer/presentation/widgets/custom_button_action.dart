import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracking/features/timer/presentation/widgets/timer_view_body.dart';

import '../manager/timer_cubit/timer_cubit.dart';
import 'custom_circle_button.dart';

class CustomButtonAction extends StatelessWidget {
  const CustomButtonAction({super.key});

  @override
  Widget build(BuildContext context) {
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
        BlocBuilder<TimerCubit, TimerState>(
          builder: (context, state) {
            return CustomCircleButton(
              onTap: () {
                BlocProvider.of<TimerCubit>(context).stopAndResetTimer();
              },
              icon: Icon(
                BlocProvider
                    .of<TimerCubit>(context)
                    .isPlay ? Icons.pause_rounded :
                Icons.play_arrow_rounded,
                size: 50.w,
                color: Colors.white,
              ),
              color: const Color(0xff5F6CE2),
              size: 96.h,
            );
          },
        ),
        CustomCircleButton(
          icon: Icon(
            Icons.check,
            size: 25.w,
            color: const Color(0xff5F6CE2),
          ),
          color: const Color(0xffEBEEFF),
          size: 56.h,
        )
      ],
    );
  }
}
