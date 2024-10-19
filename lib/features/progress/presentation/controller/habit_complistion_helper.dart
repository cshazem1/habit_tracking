import '../../../home/presentation/manager/home_cubit.dart';
import '../../../new habit/Data/model/habit_view_model.dart';
import '../../../new habit/Data/model/habits_final_model.dart';

class HabitCompletionHelper {
  static Map<int, IsCompleted> getHabitCompletionStatus(
      DateTime startDate, int daysRange) {
    Map<int, IsCompleted> isCompletedList = {};

    for (int i = 0; i < daysRange; i++) {
      isCompletedList[i] ??= IsCompleted(completed: 0, incomplete: 0);
      DateTime currentDate = startDate.add(Duration(days: i));

      for (var element in HabitViewModel.habitsBox!.values) {
        if (element.habits.containsKey(currentDate)) {
          List<HabitFinalModel>? isComplete = element.habits[currentDate];
          for (var habit in isComplete!) {
            if (habit.isCompleted) {
              isCompletedList[i]!.completed++;
            } else {
              isCompletedList[i]!.incomplete++;
            }
          }
        }
      }
    }

    return isCompletedList;
  }
}
