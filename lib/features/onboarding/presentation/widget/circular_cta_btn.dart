import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracking/features/onboarding/presentation/manger/onboarding_controller.dart';

class CircularCtaBtn extends StatelessWidget {
  const CircularCtaBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => OnboardingController.instance.nextPage(),
        child:Icon(Icons.arrow_forward,size: 24,),
        style:ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(16),
            backgroundColor:Color(0xff5F6CE2),
            foregroundColor: Color(0xffFFFFFF)),
    );

  }
}
