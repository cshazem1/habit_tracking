
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracking/features/timer/presentation/widgets/timer_widget.dart';

import '../manager/timer_cubit/timer_cubit.dart';
import 'custom_item.dart';

class TimerViewBody extends StatelessWidget {
  const TimerViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        CustomItem(),
        TimerWidget(),
        CustomButtonAction(),
        SizedBox(),
      ],
    );
  }
}

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
            color: Color(0xff5F6CE2),
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

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    required this.size,
    required this.color,
    required this.icon,
    this.onTap,
    super.key,
  });

  final Color color;
  final double size;
  final Icon icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.w,
        height: size.w,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: icon,
      ),
    );
  }
}
