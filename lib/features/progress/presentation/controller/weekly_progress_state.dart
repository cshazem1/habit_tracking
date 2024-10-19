abstract class WeeklyProgressState {}

class WeeklyProgressInitial extends WeeklyProgressState {}

class WeeklyProgressLoading extends WeeklyProgressState {}

class WeeklyProgressLoaded extends WeeklyProgressState {
  final double completionPercentage;
  final List<int> habitsPerDay;
  final List<int> completedHabitsPerDay; // New field for completed habits
  final int bestStreak;
  final int totalHabits;

  WeeklyProgressLoaded({
    required this.completionPercentage,
    required this.habitsPerDay,
    required this.completedHabitsPerDay, // Add this line
    required this.bestStreak,
    required this.totalHabits,
  });
}

class WeeklyProgressError extends WeeklyProgressState {
  final String message;

  WeeklyProgressError(this.message);
}
