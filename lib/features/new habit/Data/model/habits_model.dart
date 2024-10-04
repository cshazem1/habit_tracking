import 'package:hive/hive.dart';

part 'habits_model.g.dart';

@HiveType(typeId: 0)
class HabitsModel extends HiveObject {
  @HiveField(0)
  final String habitName;

  @HiveField(1)
  final int habitColor;

  @HiveField(2)
  final String habitIcon;

  @HiveField(3)
  final String timer;

  @HiveField(4)
  final String reminder;

  HabitsModel({
    required this.habitName ,
    required this.habitColor ,
    required this.habitIcon ,
    required this.timer ,
    required this.reminder});


}