
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracking/features/new%20habit/Data/model/habits_final_model.dart';
import 'package:meta/meta.dart';

import '../../../new habit/Data/model/habit_view_model.dart';

part 'home_state.dart';

class IsCompleted {
  int completed = 0;
  int incomplete = 0;

  IsCompleted({required this.completed, required this.incomplete});
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  DateTime? userSelectedDate;
  List<HabitFinalModel>? habitFinalModel;

  List<HabitFinalModel>? isComplete;

  Map<int, IsCompleted> isCompletedList = {};

  void isCompleted(DateTime start) {
    isCompletedList = {};
    int completed = 0;
    int incomplete = 0;

    for (int i = 0; i < 7; i++) {
      isCompletedList[i] ??= IsCompleted(completed: 0, incomplete: 0);
      DateTime selectDate = start.add(Duration(days: i));
      for (var element in HabitViewModel.habitsBox!.values) {
        if (element.habits.containsKey(selectDate)) {
          isComplete = element.habits[selectDate];
          for (int j = 0; j < isComplete!.length; j++) {
            if (isComplete![j].isCompleted) {
              isCompletedList[i]!.completed++;
              completed++;
            } else {
              isCompletedList[i]!.incomplete++;
              incomplete++;
            }
          }
        }
      }
    }
    print("completed:$completed");
    print("incomplete:$incomplete");
    isCompletedList.forEach(
      (key, value) {
        print("$key: ${value.completed} / ${value.incomplete}");
      },
    );
  }

  selectDate(DateTime selectedDate) {
    print("LLLLLLLLLLLLLLLLLLLL$selectedDate");
    HabitViewModel();
    emit(SelectDateLoading());
    userSelectedDate = selectedDate;
    for (var element in HabitViewModel.habitsBox!.values) {
      if (element.habits.containsKey(selectedDate)) {
        habitFinalModel = element.habits[selectedDate];

        emit(SelectDateSuccess());

        return;
      }
      habitFinalModel = [];
      emit(SelectDateSuccess());
    }

    print(habitFinalModel);
  }

  removeHabit(int index) async {
    emit(RemoveHabitLoading());
    for (var habit in HabitViewModel.habitsBox!.values) {
      if (habit.habits.containsKey(userSelectedDate)) {
        List<HabitFinalModel>? list = habit.habits[userSelectedDate];
        list?.removeAt(index);
        HabitViewModel.habitsBox?.putAt(HabitViewModel.habitsBox!.values.toList().indexOf(habit), habit);
        return;
      }
      emit(RemoveHabitSuccess());
    }

  }

  checkHabit(int index) async {
    emit(CheckHabitLoading());
    for (var habit in HabitViewModel.habitsBox!.values) {
      if (habit.habits.containsKey(userSelectedDate)) {
        List<HabitFinalModel>? list = habit.habits[userSelectedDate];
        bool check = list?[index].isCompleted ?? false;
        list?[index].isCompleted = !check;
        HabitViewModel.habitsBox?.putAt(
            HabitViewModel.habitsBox!.values.toList().indexOf(habit), habit);
        return;
      }
      emit(CheckHabitSuccess());
    }
  }
void refresh() {
    emit(CheckHabitSuccess());
}
}
