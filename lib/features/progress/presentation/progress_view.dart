import 'package:flutter/material.dart';
import 'package:habit_tracking/core/utlis/styles.dart';
import 'package:habit_tracking/features/progress/presentation/widgets/progress_view_body.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Progress",
            style: Styles.textSemiBold16,
          ),
          centerTitle: true,
          leading:
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back))),
      body:  ProgressViewBody(),
    );
  }
}
