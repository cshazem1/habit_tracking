import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/arrow_btn.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/cta_with_label.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/password_field.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/text_field_field.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/title_and_subtitle.dart';
import 'package:habit_tracking/features/starting%20page/presentation/widgets/cta_btn.dart';
import 'package:habit_tracking/features/starting%20page/presentation/widgets/label_btn.dart';
import '../../../core/utlis/text_string.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const ArrowBtn(),

            TitleAndSubtitle(
              title: TTexts.loginTitle,
              subTitle: TTexts.loginSubTitle,
            ),

            // text fields
            const TextFieldField(
              hintLabel: 'enter your user name', label: 'User name',
            ),
            const SizedBox(height: 16,
            ),

            const PasswordField(hintLabel: "enter your password", label: 'Password', helperText: 'Forget your password?',),

            // Cta btns
            const SizedBox(height:175 ,),
            const CtaBtn(label: 'Continue'),
            const SizedBox(height: 16,),
            const CtaWithLabel(label: 'Signed in with Google'),
            const SizedBox(height: 12,),
            const LabelBtn(label: "Don’t have account? Sign up"),
          ],
        ),
      ),
    );
  }
}
