import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracking/features/starting%20page/presentation/widgets/starting_image_and_text.dart';
import '../../../core/utlis/image_strings.dart';
import '../../../core/utlis/text_string.dart';


class StartingView extends StatelessWidget {
  const StartingView({super.key});

  @override
  Widget build(BuildContext context) {
   // final controller = Get.put(OnboardingController());
    return Scaffold(
        body: Stack(
        children: [
        PageView(
        children: [
        StartingImageAndText(
        image: TImages.startingImage,
        title: TTexts.startScreenTitle,
        title2: TTexts.startScreenTitle0,
        subTitle: TTexts.startScreenSubTitle,
        ),
        ],
        ),
        ],
        ),
    );

  }
}
