import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';

import '../controller/yearly_cubit.dart';
import '../controller/yearly_progress_state.dart';
import 'bar_chart_widget.dart';

class YearlyProgressView extends StatelessWidget {
  const YearlyProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YearlyProgressCubit()..loadYearlyProgress(DateTime.now().year),
      child: Scaffold(
        body: BlocBuilder<YearlyProgressCubit, YearlyProgressState>(
          builder: (context, state) {
            if (state is YearlyProgressLoaded) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '${state.completionPercentage.toStringAsFixed(2)}% of habits completed this year',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(child: BarChartWidget(habitsPerDay: state.completedHabitsPerMonth)),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Best streak: ${state.bestStreak} months',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Total habits this year: ${state.totalHabits}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          context.read<YearlyProgressCubit>().moveToPreviousYear();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          context.read<YearlyProgressCubit>().moveToNextYear();
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
