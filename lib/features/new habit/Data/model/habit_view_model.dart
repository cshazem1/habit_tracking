


import 'package:flutter/material.dart';
import 'package:habit_tracking/features/new%20habit/Data/model/habits_model.dart';
import 'package:hive/hive.dart';

import '../../../../generated/assets.dart';

class HabitViewModel extends ChangeNotifier {
  String habitName = '';
  int selectedColor = Colors.green.value;
  String selectedIcon = Assets.imagesBoyDynamicColor;
  String selectedTimer = "10";
  DateTime reminder= DateTime.now();

  Box<HabitsModel>? _habitsBox;

  // final Box<HabitsModel> _habitBox = Hive.box<HabitsModel>('habits');
  HabitViewModel(){
    _habitsBox = Hive.box<HabitsModel>('habits');
  }


  void setHabitName(String name){
    habitName = name;
    notifyListeners();

  }

  void setHabitColor(int color){
    selectedColor = color;
    notifyListeners();
  }
  void setHabitIcon(String icon){
    selectedIcon = icon;
    notifyListeners();
  }
  void setHabitReminder(DateTime time){
    reminder = time;
    notifyListeners();
  }

  void setHabitTimer(String timer){
    selectedTimer = timer;
    notifyListeners();
  }

  void deleteHabit(int index) async {
    _habitsBox?.deleteAt(index);
    notifyListeners();
  }

  void addHabit()  {
    final newHabit = HabitsModel(
        habitName: habitName,
        habitColor: selectedColor,
        habitIcon: selectedIcon,
        timer: selectedTimer,
        reminder: reminder.toString()
    );

    _habitsBox?.add(newHabit);
    notifyListeners();
  }

  List<HabitsModel> get habits => _habitsBox?.values.toList() ?? [];


}