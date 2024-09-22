import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracking/features/timer/presentation/manager/timer_cubit/timer_cubit.dart';

import 'package:habit_tracking/features/timer/presentation/widgets/timer_view_body.dart';

import '../../../core/utlis/styles.dart';

class TimerViews extends StatelessWidget {
  const TimerViews({super.key, required this.nameAppBar});

  final String nameAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(nameAppBar, style: Styles.textSemiBold16),
      ),
      body: BlocProvider(
        create: (context) => TimerCubit()
          ..init(maxTime: 30, progress: 1)
          ..startTimer(),
        child: const TimerViewBody(),
      ),
    );
  }
}
