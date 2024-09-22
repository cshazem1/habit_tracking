import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());
  int? maxTime; // Total time in seconds (e.g., 5 minutes)
  int? remainingTime;
  double? progress;
  Timer? timer;
  bool isPlay = true;
  final player = AudioPlayer();

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime! > 0) {
        remainingTime = remainingTime! - 1;
        progress = remainingTime! / maxTime!;

        if (remainingTime! > maxTime! / 4) {
          player.play(AssetSource('music/videoplayback2.mp3'));
        } else {
          player.play(AssetSource('music/videoplaybac.mp3'));
        }

        emit(TimerSuccess(text: getFormattedTime()));
      } else {
        timer.cancel();
        isPlay = false;
        emit(TimerSuccess(text: getFormattedTime()));
      }
    });
  }

  void resetTimer() {
    pauseTimer();
    remainingTime = maxTime;
    progress = 1;
    isPlay = true;
    startTimer();
    emit(TimerSuccess(text: getFormattedTime()));
  }

  void stopAndResetTimer() {
    if (isPlay) {
      pauseTimer();
      isPlay = false;
      emit(TimerSuccess(text: getFormattedTime()));
    } else {
      pauseTimer();
      startTimer();
      isPlay = true;
      emit(TimerSuccess(text: getFormattedTime()));
    }
  }

  void pauseTimer() {
    timer?.cancel();
  }

  String getFormattedTime() {
    int minutes = remainingTime! ~/ 60;
    int seconds = remainingTime! % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void init({required int maxTime, required double progress}) {
    {
      this.maxTime = maxTime;
      remainingTime = maxTime;
      this.progress = progress;
      emit(TimerInitial());
    }
  }
}
