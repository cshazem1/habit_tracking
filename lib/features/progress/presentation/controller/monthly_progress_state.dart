abstract class MonthlyProgressState {}

class MonthlyProgressInitial extends MonthlyProgressState {}

class MonthlyProgressLoaded extends MonthlyProgressState {
  final double completionPercentage;
  final List<int> habitsPerDay;
  final List<int> completedHabitsPerDay;
  final int bestStreak;
  final int totalHabits;

  MonthlyProgressLoaded({
    required this.completionPercentage,
    required this.habitsPerDay,
    required this.completedHabitsPerDay,
    required this.bestStreak,
    required this.totalHabits,
  });
}
