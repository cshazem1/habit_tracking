import 'package:flutter/material.dart';
import 'package:habit_tracking/features/new%20habit/Data/model/habits_final_model.dart';
import 'package:habit_tracking/features/new%20habit/Data/model/habits_model.dart';
import 'package:hive/hive.dart';

import '../../../../generated/assets.dart';

class HabitViewModel extends ChangeNotifier {
  String habitName = '';
  int selectedColor = Colors.green.value;
  String selectedIcon = Assets.imagesBoyDynamicColor;
  String selectedTimer = "10";
  DateTime reminder = DateTime.now();

  static Box<HabitsModel>? habitsBox;

  // final Box<HabitsModel> _habitBox = Hive.box<HabitsModel>('habits');
  HabitViewModel() {
    final now = DateTime.now();
    final reminderTime = DateTime(now.year, now.month, now.day);
    habitsBox = Hive.box<HabitsModel>('habits');
    for (var element in habitsBox!.values) {
      print(element.habits[reminderTime]?.length);
    }
  }

  void setHabitName(String name) {
    habitName = name;
    notifyListeners();
  }

  void setHabitColor(int color) {
    selectedColor = color;
    notifyListeners();
  }

  void setHabitIcon(String icon) {
    selectedIcon = icon;
    notifyListeners();
  }

  void setHabitReminder(DateTime time) {
    reminder = time;
    notifyListeners();
  }

  void setHabitTimer(String timer) {
    selectedTimer = timer;
    notifyListeners();
  }

  void deleteHabit(int index) async {
    await habitsBox?.deleteAt(index);
    notifyListeners();
  }
//Nada changes normalized date
  void addHabit(DateTime date) {
    DateTime normalizedDate = DateTime(date.year, date.month, date.day);
    HabitsModel newHabit = HabitsModel(habits: {
      normalizedDate: [
        HabitFinalModel(
            habitName: habitName,
            habitColor: selectedColor,
            habitIcon: selectedIcon,
            timer: selectedTimer,
            reminder: reminder.toString())
      ]
    });
    Set<HabitsModel>? habitFinalModel = habitsBox?.values.toSet();
    for (var element in habitFinalModel!) {
      if (element.habits.containsKey(normalizedDate)) {
        List<HabitFinalModel>? list = element.habits[normalizedDate];
        list?.add(HabitFinalModel(
            habitName: habitName,
            habitColor: selectedColor,
            habitIcon: selectedIcon,
            timer: selectedTimer,
            reminder: reminder.toString()));

        habitsBox?.putAt(habitFinalModel.toList().indexOf(element), element);
        notifyListeners();
        return;
      }
      notifyListeners();

    }
    habitsBox?.add(newHabit);
    notifyListeners();
  }

  void editHabit(DateTime date,int index) {
    DateTime normalizedDate = DateTime(date.year, date.month, date.day);

    HabitsModel newHabit = HabitsModel(habits: {
      normalizedDate: [
        HabitFinalModel(
            habitName: habitName,
            habitColor: selectedColor,
            habitIcon: selectedIcon,
            timer: selectedTimer,
            reminder: reminder.toString())
      ]
    });
    Set<HabitsModel>? habitFinalModel = habitsBox?.values.toSet();
    for (var element in habitFinalModel!) {
      if (element.habits.containsKey(normalizedDate)) {
        List<HabitFinalModel>? list = element.habits[normalizedDate];
        list?[index]=HabitFinalModel(
            habitName: habitName,
            habitColor: selectedColor,
            habitIcon: selectedIcon,
            timer: selectedTimer,
            reminder: reminder.toString());

        habitsBox?.putAt(habitFinalModel.toList().indexOf(element), element);
        notifyListeners();
        return;
      }
      notifyListeners();

    }
    habitsBox?.add(newHabit);
    notifyListeners();
  }




  removeHabit(DateTime date, int index) async {
    DateTime normalizedDate = DateTime(date.year, date.month, date.day);
    for (var habit in habitsBox!.values) {
      if (habit.habits.containsKey(normalizedDate)) {
        List<HabitFinalModel>? list = habit.habits[normalizedDate];
        list?.removeAt(index);
        habitsBox?.putAt(habitsBox!.values.toList().indexOf(habit), habit);
        notifyListeners();
        return;
      }
    }
  }

  List<HabitFinalModel>? getHabitByDate(DateTime date) {
    DateTime normalizedDate = DateTime(date.year, date.month, date.day);
    return habitsBox?.get(normalizedDate)?.habits[normalizedDate];
  }
  List<HabitsModel> get habits => habitsBox?.values.toList() ?? [];
}