import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:habit_tracking/features/progress/presentation/widgets/progress_card.dart';
import 'package:habit_tracking/features/progress/presentation/widgets/progress_chart_container.dart';

import '../../../home/presentation/manager/home_cubit.dart';
import '../controller/yearly_cubit.dart';
import '../controller/yearly_progress_state.dart';
import 'bar_chart_widget.dart';

class YearlyProgressView extends StatelessWidget {
  const YearlyProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YearlyProgressCubit(context.read<HomeCubit>())..loadYearlyProgress(DateTime.now().year),
      child: Scaffold(
        body: BlocBuilder<YearlyProgressCubit, YearlyProgressState>(
          builder: (context, state) {
            if (state is YearlyProgressLoaded) {
              return Column(
                children: [
                  // Percentage of habits done
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            context.read<YearlyProgressCubit>().moveToPreviousYear();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            context.read<YearlyProgressCubit>().moveToNextYear();
                          },
                        ),
                      ],
                    ),
                  ),
                  // Bar chart for habits done per day
                  ProgressChartContainer(
                    percentage: state.completionPercentage.toStringAsFixed(2),
                    habitsPerDayList: state.completedHabitsPerMonth,
                  ),
                  // Best streaks
                  // Total habits
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProgressCard(num: state.bestStreak.toString(), title: "Best Streak Days"),
                        ProgressCard(num: state.totalHabits.toString(), title: "Habit done"),
                      ],
                    ),
                  ),
                  // Navigation arrows for previous/next week
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
