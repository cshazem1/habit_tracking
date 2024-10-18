abstract class YearlyProgressState {}

class YearlyProgressInitial extends YearlyProgressState {}

class YearlyProgressLoaded extends YearlyProgressState {
  final double completionPercentage;
  final List<int> habitsPerMonth;
  final List<int> completedHabitsPerMonth; // New field for completed habits
  final int bestStreak;
  final int totalHabits;

  YearlyProgressLoaded({
    required this.completionPercentage,
    required this.habitsPerMonth,
    required this.completedHabitsPerMonth, // Add this line
    required this.bestStreak,
    required this.totalHabits,
  });
}
