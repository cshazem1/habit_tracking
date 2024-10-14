part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class SelectDateLoading extends HomeState {}
final class SelectDateSuccess extends HomeState {}



final class RemoveHabitSuccess extends HomeState {}
final class RemoveHabitLoading extends HomeState {}


final class CheckHabitSuccess extends HomeState {}
final class CheckHabitLoading extends HomeState {}