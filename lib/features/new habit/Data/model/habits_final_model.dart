
import 'package:habit_tracking/features/new%20habit/Data/model/habits_model.dart';
import 'package:hive/hive.dart';
part 'habits_final_model.g.dart';
@HiveType(typeId: 1)

class HabitFinalModel extends HiveObject{


  @HiveField(0)
   String habitName;

  @HiveField(1)
   int habitColor;

  @HiveField(2)
   String habitIcon;

  @HiveField(3)
   String timer;

  @HiveField(4)
   String reminder;
  @HiveField(5)
 bool isCompleted;
  HabitFinalModel({
    required this.habitName ,
    required this.habitColor ,
    required this.habitIcon ,
    required this.timer ,
    this.isCompleted = false,

    required this.reminder});

}