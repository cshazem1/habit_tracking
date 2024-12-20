import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracking/features/progress/presentation/widgets/progress_card.dart';
import 'package:habit_tracking/features/progress/presentation/widgets/progress_chart_container.dart';
import '../../../home/presentation/manager/home_cubit.dart';
import '../controller/weekly_progress_cubit.dart';
import '../controller/weekly_progress_state.dart';

class WeeklyProgressView extends StatelessWidget {
  const WeeklyProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeeklyProgressCubit()..loadWeeklyProgress(DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1))),
      child: Scaffold(
        body: BlocBuilder<WeeklyProgressCubit, WeeklyProgressState>(
          builder: (context, state) {
            if (state is WeeklyProgressLoaded) {
              return Column(
                children: [
                  // Percentage of habits done
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            HomeCubit.get(context).selectDate(DateTime.now());

                            HomeCubit.get(context).isCompleted(DateTime.now());
                            context.read<WeeklyProgressCubit>().moveToPreviousWeek();
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () {
                            context.read<WeeklyProgressCubit>().moveToNextWeek();
                          },
                        ),
                      ],
                    ),

                  ),
                  // Bar chart for habits done per day
                  ProgressChartContainer(
                      percentage: state.completionPercentage.toStringAsFixed(2), habitsPerDayList: state.completedHabitsPerDay),
                  // Best streaks
                  // Total habits
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProgressCard(num: state.bestStreak.toString(), title: "Best Streak Days"),
                        ProgressCard(num: state.totalHabits.toString() , title: "Habit done")
                      ],
                    ),
                  ),

                  // Navigation arrows for previous/next week
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
