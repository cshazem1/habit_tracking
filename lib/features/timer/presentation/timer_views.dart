import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracking/features/timer/presentation/manager/timer_cubit/timer_cubit.dart';

import 'package:habit_tracking/features/timer/presentation/widgets/timer_view_body.dart';

import '../../../core/utlis/styles.dart';

class TimerViews extends StatelessWidget {
  const TimerViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      TimerCubit()
        ..init(maxTime: 2*60, progress: 1)
        ,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
          const Text('Meditate for .5 minutes', style: Styles.textSemiBold16),
        ),
        body: const TimerViewBody()
      ),
    );
  }
}
