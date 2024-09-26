import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracking/features/auth/presentation/screens/login/login_view.dart';
import 'package:habit_tracking/features/login%20screen/presentation/login_screen.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/arrow_btn.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/cta_with_label.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/password_field.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/text_field_field.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/title_and_subtitle.dart';
import 'package:habit_tracking/features/starting%20page/presentation/widgets/cta_btn.dart';
import 'package:habit_tracking/features/starting%20page/presentation/widgets/label_btn.dart';
import '../../../core/utlis/text_string.dart';


class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const ArrowBtn(),

            TitleAndSubtitle(
              title: TTexts.registerTitle,
              subTitle: TTexts.registerSubTitle,
            ),

            // text fields
            const TextFieldField(
              hintLabel: 'enter your user name', label: 'User name',
            ),
            const SizedBox(height: 16,
            ),
            const TextFieldField(
              hintLabel: "enter your email", label: 'Email',
            ),
            const SizedBox(height: 16,
            ),
            const PasswordField(hintLabel: "enter your password", label: 'Password', helperText: 'must be at least 8 characters',),

            // Cta btns
            const SizedBox(height:60 ,),
            const CtaBtn(label: 'Continue'),
            const SizedBox(height: 16,),
            const CtaWithLabel(label: 'Signed up with Google'),
            const SizedBox(height: 12,),
            LabelBtn(label: "I’m already have an account", onClick: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginScreen();
            },));
            },),
          ],
        ),
      ),
    );
  }
}
