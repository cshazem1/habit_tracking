import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracking/features/timer/data/models/item_model.dart';
import 'package:habit_tracking/features/timer/presentation/widgets/timer_widget.dart';

import '../../../../generated/assets.dart';
import '../manager/timer_cubit/timer_cubit.dart';
import 'custom_button_action.dart';
import 'custom_item.dart';

class TimerViewBody extends StatelessWidget {
  const TimerViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(builder: (context, state) {
      final List<ItemModel> items = [
        ItemModel(
            title: "Time",
            subTitle: ((TimerCubit.get(context).maxTime! -
                        TimerCubit.get(context).remainingTime!) ~/
                    60)
                .toString(),
            image: Assets.imagesBagDynamicColor,
            totalTime: (TimerCubit.get(context).maxTime!).toString()),
      ];
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomItem(itemModel: items[0]),
          TimerWidget(),
          CustomButtonAction(),
          SizedBox(),
        ],
      );
    });
  }
}
