


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracking/features/progress/presentation/widgets/progress_card.dart';
import 'package:habit_tracking/features/progress/presentation/widgets/progress_chart_container.dart';

import '../../../home/presentation/manager/home_cubit.dart';
import '../controller/monthly_cubit.dart';
import '../controller/monthly_progress_state.dart';

class MonthlyProgressView extends StatelessWidget {
  const MonthlyProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MonthlyProgressCubit(context.read<HomeCubit>())..loadMonthlyProgress(DateTime.now()),
      child: Scaffold(
        body: BlocBuilder<MonthlyProgressCubit, MonthlyProgressState>(
          builder: (context, state) {
            if (state is MonthlyProgressLoaded) {
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
                            context.read<MonthlyProgressCubit>().moveToPreviousMonth();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            context.read<MonthlyProgressCubit>().moveToNextMonth();
                          },
                        ),
                      ],
                    ),
                  ),
                  // Bar chart for habits done per day
                  ProgressChartContainer(
                    percentage: state.completionPercentage.toStringAsFixed(2),
                    habitsPerDayList: state.completedHabitsPerDay,
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
