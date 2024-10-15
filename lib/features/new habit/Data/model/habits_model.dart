import 'package:habit_tracking/features/new%20habit/Data/model/habits_final_model.dart';
import 'package:hive/hive.dart';

part 'habits_model.g.dart';

@HiveType(typeId: 0)
class HabitsModel extends HiveObject {
  @HiveField(0)
  Map<DateTime,List<HabitFinalModel>> habits;
  HabitsModel({required this.habits});

}