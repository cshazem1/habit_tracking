import 'package:flutter/material.dart';

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
      body: const TimerViewBody(),
    );
  }
}



