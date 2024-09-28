import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:habit_tracking/core/utlis/text_string.dart';
import 'package:habit_tracking/features/onboarding/presentation/manger/onboarding_controller.dart';
import 'package:habit_tracking/features/onboarding/presentation/widget/circular_cta_btn.dart';
import 'package:habit_tracking/features/onboarding/presentation/widget/dot_navigation.dart';
import 'package:habit_tracking/features/onboarding/presentation/widget/onboarding_image_and_text.dart';
import 'package:habit_tracking/features/onboarding/presentation/widget/skip.dart';
import 'package:habit_tracking/generated/assets.dart';


class OnboardinView extends StatelessWidget {
  const OnboardinView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnboardingImageAndText(
                  image: Assets.imagesOnboarding01,
                  title: TTexts.onBoardingTitle1,
                  title2: TTexts.onBoardingTitle01,
                  subTitle: TTexts.onBoardingSubTitle1
              ),
              OnboardingImageAndText(
                  image: Assets.imagesOnboarding02,
                  title: TTexts.onBoardingTitle2,
                  title2: TTexts.onBoardingTitle02,
                  subTitle: TTexts.onBoardingSubTitle2
              ),
              OnboardingImageAndText(
                  image: Assets.imagesOnboarding03,
                  title: TTexts.onBoardingTitle3,
                  title2: TTexts.onBoardingTitle03,
                  subTitle: TTexts.onBoardingSubTitle3
              ),
            ],
          ),
          // skip btn
          const SkipBtn(),

          // dot navigation and circular btn
          const Positioned(bottom: 65,left: 16,right: 16,
            child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              DotNavigation(),
              SizedBox(width: 50,),
              CircularCtaBtn(),
            ],
          ),
          ),

        ],
      ),
    );
  }
}
