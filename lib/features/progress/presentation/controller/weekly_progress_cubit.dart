import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:habit_tracking/features/new%20habit/Data/model/habits_final_model.dart';
import 'package:habit_tracking/features/new%20habit/Data/model/habits_model.dart';
import 'package:habit_tracking/features/progress/presentation/controller/weekly_progress_state.dart';

class WeeklyProgressCubit extends Cubit<WeeklyProgressState> {

  WeeklyProgressCubit() : super(WeeklyProgressInitial());


  static Box<HabitsModel>? habitsBox;

  DateTime startOfWeek = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)); // Sunday of this week
  DateTime endOfWeek = DateTime.now().add(Duration(days: 7 - DateTime.now().weekday)); // Saturday of this week

  void loadWeeklyProgress(DateTime startDate) async {
    try {
      emit(WeeklyProgressLoading());
      // Adjust week range based on the provided startDate
      startOfWeek = startDate;
      endOfWeek = startDate.add(const Duration(days: 6));
      habitsBox = Hive.box<HabitsModel>('habits');

      int totalHabits = 0;
      int completedHabits = 0;
      List<int> habitsPerDay = List.filled(7, 0); // for 7 days from Sunday to Saturday
      List<int> completedHabitsPerDay = List.filled(7, 0); // New list for completed habits
      int bestStreak = 0;
      int currentStreak = 0;

      // Loop through each day of the week
      for (int i = 0; i < 7; i++) {
        DateTime currentDay = startOfWeek.add(Duration(days: i));
        // Fetch habits for the current day
        List<HabitFinalModel>? dayHabits = habitsBox?.get(currentDay)?.habits[currentDay];
        if (dayHabits != null) {
          totalHabits += dayHabits.length;
          habitsPerDay[i] = dayHabits.length; // Total habits for the day
          completedHabitsPerDay[i] = dayHabits.where((habit) => habit.isCompleted).length; // Completed habits for the day
          completedHabits += completedHabitsPerDay[i]; // Sum up completed habits for the week

          // Calculate streaks
          if (habitsPerDay[i] > 0) {
            currentStreak += 1;
            if (currentStreak > bestStreak) {
              bestStreak = currentStreak;
            }
          } else {
            currentStreak = 0;
          }
        } else {
          // Debug log if no habits found for the day
          print('No habits found for $currentDay');
        }
      }

      double completionPercentage = (totalHabits == 0) ? 0 : (completedHabits / totalHabits) * 100;

      // Debug logs
      print('Total Habits: $totalHabits, Completed Habits: $completedHabits, Habits Per Day: $habitsPerDay');
      print('Completion Percentage: $completionPercentage%, Best Streak: $bestStreak');

      emit(WeeklyProgressLoaded(
        completionPercentage: completionPercentage,
        habitsPerDay: habitsPerDay,
        completedHabitsPerDay: completedHabitsPerDay, // Pass completed habits for the week
        bestStreak: bestStreak,
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
