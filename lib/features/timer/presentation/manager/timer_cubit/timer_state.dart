part of 'timer_cubit.dart';

@immutable
sealed class TimerState {}

final class TimerInitial extends TimerState {}
final class TimerSuccess extends TimerState {
  String text;
  TimerSuccess({required this.text});
}
