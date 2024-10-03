import 'package:hive/hive.dart';

part 'habits_model.g.dart';

@HiveType(typeId: 0)
class HabitsModel extends HiveObject {
  @HiveField(0)
  String habitName;

  @HiveField(1)
  int habitColor;

  @HiveField(2)
  String habitIcon;

  @HiveField(3)
  String frequency;

  @HiveField(4)
  String repeat;

  @HiveField(5)
  String time;

  @HiveField(6)
  String reminder;

  HabitsModel({
    required this.habitName ,
    required this.habitColor ,
    required this.habitIcon ,
    required this.frequency,
    required this.repeat ,
    required this.time ,
    required this.reminder});


}