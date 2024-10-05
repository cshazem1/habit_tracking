import 'package:flutter/material.dart';
import 'package:habit_tracking/features/onboarding/presentation/manger/onboarding_controller.dart';

class CircularCtaBtn extends StatelessWidget {
  const CircularCtaBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => OnboardingController.instance.nextPage(context),
        style:ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(16),
            backgroundColor:const Color(0xff5F6CE2),
            foregroundColor: const Color(0xffFFFFFF)),
        child:const Icon(Icons.arrow_forward,size: 24,),
    );

  }
}
