import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';

import '../../../new habit/Data/model/habits_final_model.dart';
import '../../../new habit/Data/model/habits_model.dart';
import 'monthly_progress_state.dart';

class MonthlyProgressCubit extends Cubit<MonthlyProgressState> {
  MonthlyProgressCubit() : super(MonthlyProgressInitial());

  static Box<HabitsModel>? habitsBox;

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

    emit(MonthlyProgressLoaded(
      completionPercentage: completionPercentage,
      habitsPerDay: habitsPerDay, // This can remain the same if it's for displaying habits completed
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
