import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';

import '../controller/weekly_progress_cubit.dart';
import '../controller/weekly_progress_state.dart';
import 'bar_chart_widget.dart';
import 'progress_tab_bar.dart';

class WeeklyProgressView extends StatelessWidget {
  const WeeklyProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeeklyProgressCubit()..loadWeeklyProgress(DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1))),
      child: Scaffold(
        appBar: AppBar(title: Text('Weekly Progress')),
        body: BlocBuilder<WeeklyProgressCubit, WeeklyProgressState>(
          builder: (context, state) {
            if (state is WeeklyProgressLoaded) {
              return Column(
                children: [
                  // Percentage of habits done
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '${state.completionPercentage.toStringAsFixed(2)}% of habits completed this week',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Bar chart for habits done per day
                  Expanded(
                    child: BarChartWidget(habitsPerDay: state.completedHabitsPerDay),
                  ),

                  // Best streaks
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Best streak: ${state.bestStreak} days',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),

                  // Total habits
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Total habits this week: ${state.totalHabits}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),

                  // Navigation arrows for previous/next week
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          context.read<WeeklyProgressCubit>().moveToPreviousWeek();
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          context.read<WeeklyProgressCubit>().moveToNextWeek();
                        },
                      ),
                    ],
                  ),
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
