
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracking/features/timer/presentation/widgets/timer_widget.dart';

import '../manager/timer_cubit/timer_cubit.dart';
import 'custom_button_action.dart';
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


