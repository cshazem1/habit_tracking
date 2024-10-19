import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:habit_tracking/features/new%20habit/Data/model/habits_final_model.dart';
import 'package:habit_tracking/features/new%20habit/Data/model/habits_model.dart';
import 'package:habit_tracking/features/progress/presentation/controller/monthly_progress_state.dart';

import '../../../home/presentation/manager/home_cubit.dart'; // Import HomeCubit

class MonthlyProgressCubit extends Cubit<MonthlyProgressState> {
  MonthlyProgressCubit(this.homeCubit) : super(MonthlyProgressInitial());

  static Box<HabitsModel>? habitsBox;
  final HomeCubit homeCubit; // Use HomeCubit here

  DateTime startOfMonth = DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime endOfMonth = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

  void loadMonthlyProgress(DateTime startDate) {
    startOfMonth = DateTime(startDate.year, startDate.month, 1);
    endOfMonth = DateTime(startDate.year, startDate.month + 1, 0); // last day of month

    habitsBox = Hive.box<HabitsModel>('habits');

    int totalHabits = 0;
    int completedHabits = 0;
    List<int> habitsPerDay = List.filled(endOfMonth.day, 0); // Fill for every day in the month
    int bestStreak = 0;
    int currentStreak = 0;

    for (int i = 0; i < endOfMonth.day; i++) {
      DateTime currentDay = startOfMonth.add(Duration(days: i));
      List<HabitFinalModel>? dayHabits = habitsBox?.get(currentDay)?.habits[currentDay];

      if (dayHabits != null) {
        totalHabits += dayHabits.length;
        habitsPerDay[i] = dayHabits.where((habit) => habit.isCompleted).length;
        completedHabits += habitsPerDay[i];

        if (habitsPerDay[i] > 0) {
          currentStreak += 1;
          if (currentStreak > bestStreak) {
            bestStreak = currentStreak;
          }
        } else {
          currentStreak = 0;
        }
      }
    }

    double completionPercentage = (totalHabits == 0) ? 0 : (completedHabits / totalHabits) * 100;

    // Accessing isCompleted data from HomeCubit
    print(homeCubit.isCompletedList);

    emit(MonthlyProgressLoaded(
      completionPercentage: completionPercentage,
      habitsPerDay: habitsPerDay,
      completedHabitsPerDay: habitsPerDay, // Assuming this is intended to show the same data
      bestStreak: bestStreak,
      totalHabits: totalHabits,
    ));
  }

  void moveToPreviousMonth() {
    loadMonthlyProgress(DateTime(startOfMonth.year, startOfMonth.month - 1, 1));
  }

  void moveToNextMonth() {
    loadMonthlyProgress(DateTime(startOfMonth.year, startOfMonth.month + 1, 1));
  }
}
