import 'package:flutter/material.dart';
import 'package:habit_tracking/features/onboarding/presentation/manger/onboarding_controller.dart';
import '../../../../core/utlis/styles.dart';

class SkipBtn extends StatelessWidget {
  const SkipBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(top:32,
      right: 16,
      child: TextButton(
        onPressed: () => OnboardingController.instance.skipPage(),
        child: Text("skip",
            style: Styles.textMedium14.copyWith(
              color: const Color(0xff7C84A3),
            )),
      ),
    );
  }
}
