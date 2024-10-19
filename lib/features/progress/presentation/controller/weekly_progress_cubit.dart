import 'package:bloc/bloc.dart';
import 'package:habit_tracking/features/progress/presentation/controller/weekly_progress_state.dart';
import 'package:hive/hive.dart';

import '../../../home/presentation/manager/home_cubit.dart';
import '../../../new habit/Data/model/habits_model.dart';
import 'habit_complistion_helper.dart';




class WeeklyProgressCubit extends Cubit<WeeklyProgressState> {
  WeeklyProgressCubit() : super(WeeklyProgressInitial());

  static Box<HabitsModel>? habitsBox;
  DateTime startOfWeek = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));

  void loadWeeklyProgress(DateTime startDate) async {
    try {
      emit(WeeklyProgressLoading());

      // Use the helper method to calculate completed and incomplete habits for the week
      Map<int, IsCompleted> isCompletedList = HabitCompletionHelper.getHabitCompletionStatus(startDate, 7);

      int totalHabits = 0;
      int completedHabits = 0;
      List<int> habitsPerDay = List.filled(7, 0);
      List<int> completedHabitsPerDay = List.filled(7, 0);

      // Populate the results from isCompletedList
      for (int i = 0; i < 7; i++) {
        habitsPerDay[i] = isCompletedList[i]!.completed + isCompletedList[i]!.incomplete;
        completedHabitsPerDay[i] = isCompletedList[i]!.completed;
        totalHabits += habitsPerDay[i];
        completedHabits += completedHabitsPerDay[i];
      }

      double completionPercentage = (totalHabits == 0) ? 0 : (completedHabits / totalHabits) * 100;
      emit(WeeklyProgressLoaded(
        completionPercentage: completionPercentage,
        habitsPerDay: habitsPerDay,
        completedHabitsPerDay: completedHabitsPerDay,
        bestStreak: 0, // You can calculate streaks if needed
        totalHabits: totalHabits,
      ));
    } catch (e) {
      emit(WeeklyProgressError('Failed to load weekly progress: $e'));
    }
  }

  void moveToPreviousWeek() {
    loadWeeklyProgress(startOfWeek.subtract(Duration(days: 7)));
  }

  void moveToNextWeek() {
    loadWeeklyProgress(startOfWeek.add(Duration(days: 7)));
  }
}
