import 'package:flutter/material.dart';
import 'package:habit_tracking/features/progress/presentation/widgets/progress_card.dart';
import 'package:habit_tracking/features/progress/presentation/widgets/progress_chart_container.dart';
import 'package:habit_tracking/features/progress/presentation/widgets/progress_list_tile.dart';
import 'package:habit_tracking/features/progress/presentation/widgets/progress_tab_bar.dart';

class ProgressViewBody extends StatelessWidget {
  const ProgressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ProgressTabBar(),
        SizedBox(height: 10,),
        SizedBox(
          width: double.maxFinite,
            child: ProgressListTile()),
        ProgressChartContainer(),
        SizedBox(height: 5,),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProgressCard(num: "3", title: "Best Streak Days"),
            ProgressCard(num: "12", title: "Habit done")
          ],
        )
      ],
    );
  }
}