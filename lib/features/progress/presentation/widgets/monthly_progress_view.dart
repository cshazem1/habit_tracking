import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';

import '../controller/monthly_cubit.dart';
import '../controller/monthly_progress_state.dart';
import 'bar_chart_widget.dart';

class MonthlyProgressView extends StatelessWidget {
  const MonthlyProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MonthlyProgressCubit()..loadMonthlyProgress(DateTime.now()),
      child: Scaffold(
        body: BlocBuilder<MonthlyProgressCubit, MonthlyProgressState>(
          builder: (context, state) {
            if (state is MonthlyProgressLoaded) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '${state.completionPercentage.toStringAsFixed(2)}% of habits completed this month',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(child: BarChartWidget(habitsPerDay: state.completedHabitsPerDay)),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Best streak: ${state.bestStreak} days',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Total habits this month: ${state.totalHabits}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          context.read<MonthlyProgressCubit>().moveToPreviousMonth();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          context.read<MonthlyProgressCubit>().moveToNextMonth();
                        },
                      ),
                    ],
                  ),
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
