import 'package:flutter_bloc/flutter_bloc.dart';

enum ProgressType { weekly, monthly, yearly }

class ProgressCubit extends Cubit<ProgressType> {
  ProgressCubit() : super(ProgressType.weekly);

  void showWeeklyProgress() => emit(ProgressType.weekly);
  void showMmonthlyProgress() => emit(ProgressType.monthly);
  void showYearlyProgress() => emit(ProgressType.yearly);

}
