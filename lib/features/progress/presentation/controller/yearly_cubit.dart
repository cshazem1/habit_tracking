import 'package:bloc/bloc.dart';
import 'package:habit_tracking/features/progress/presentation/controller/yearly_progress_state.dart';
import 'package:hive/hive.dart';

import '../../../new habit/Data/model/habits_final_model.dart';
import '../../../new habit/Data/model/habits_model.dart';

class YearlyProgressCubit extends Cubit<YearlyProgressState> {
  YearlyProgressCubit() : super(YearlyProgressInitial());

  static Box<HabitsModel>? habitsBox;

  DateTime startOfYear = DateTime(DateTime.now().year, 1, 1);
  DateTime endOfYear = DateTime(DateTime.now().year, 12, 31);

  void loadYearlyProgress(int year) {
    startOfYear = DateTime(year, 1, 1);
    endOfYear = DateTime(year, 12, 31);

    habitsBox = Hive.box<HabitsModel>('habits');

    int totalHabits = 0;
    int completedHabits = 0;
    List<int> habitsPerMonth = List.filled(12, 0); // Fill for 12 months
    int bestStreak = 0;
    int currentStreak = 0;

    for (int i = 0; i < 12; i++) {
      DateTime firstDayOfMonth = DateTime(year, i + 1, 1);
      DateTime lastDayOfMonth = DateTime(year, i + 2, 0);

      int monthlyHabits = 0;
      int completedMonthlyHabits = 0;

      for (int j = 0; j < lastDayOfMonth.day; j++) {
        DateTime currentDay = firstDayOfMonth.add(Duration(days: j));
        List<HabitFinalModel>? dayHabits = habitsBox?.get(currentDay)?.habits[currentDay];

        if (dayHabits != null) {
          monthlyHabits += dayHabits.length;
          completedMonthlyHabits += dayHabits.where((habit) => habit.isCompleted).length;
        }
      }

      habitsPerMonth[i] = completedMonthlyHabits;
      totalHabits += monthlyHabits;
      completedHabits += completedMonthlyHabits;

      if (completedMonthlyHabits > 0) {
        currentStreak += 1;
        if (currentStreak > bestStreak) {
          bestStreak = currentStreak;
        }
      } else {
        currentStreak = 0;
      }
    }

    double completionPercentage = (totalHabits == 0) ? 0 : (completedHabits / totalHabits) * 100;

    emit(YearlyProgressLoaded(
      completionPercentage: completionPercentage,
      habitsPerMonth: habitsPerMonth,
      bestStreak: bestStreak,
      totalHabits: totalHabits,
      completedHabitsPerMonth: habitsPerMonth, // Add this line
    ));
  }

  void moveToPreviousYear() {
    loadYearlyProgress(startOfYear.year - 1);
  }

  void moveToNextYear() {
    loadYearlyProgress(startOfYear.year + 1);
  }
}
