import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_tracking/features/login%20screen/presentation/login_screen.dart';
import 'package:habit_tracking/features/register/presentation/register_view.dart';
import 'package:habit_tracking/features/starting%20page/presentation/widgets/cta_btn.dart';
import 'package:habit_tracking/features/starting%20page/presentation/widgets/label_btn.dart';
import 'package:habit_tracking/features/starting%20page/presentation/widgets/starting_image_and_text.dart';
import '../../../core/utlis/image_strings.dart';
import '../../../core/utlis/text_string.dart';
import '../../onboarding/presentation/manger/onboarding_controller.dart';


class StartingView extends StatelessWidget {
  const StartingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());
    return Scaffold(
      body: Column(
        children: [
              StartingImageAndText(
                image: TImages.startingImage,
                title: TTexts.startScreenTitle,
                title2: TTexts.startScreenTitle0,
                subTitle: TTexts.startScreenSubTitle,
              ),
          const SizedBox(height: 24,),

               Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CtaBtn(label: 'Continue', onClick:() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const RegisterView();
                    },)); } ,
                  ),
                  const SizedBox(height: 16),
                  LabelBtn(
                    label: "Already have an account", onClick: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  },)); },
                  ),
                ],
              ),
        ],
      ),
    );
  }
}
