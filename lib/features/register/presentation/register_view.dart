//
// import 'package:flutter/material.dart';
// import 'package:habit_tracking/core/models/user_model.dart';
// import 'package:habit_tracking/core/services/user_service.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/login_screen.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/arrow_btn.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/cta_with_label.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/password_field.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/text_field_field.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/title_and_subtitle.dart';
// import 'package:habit_tracking/features/starting%20page/presentation/widgets/cta_btn.dart';
// import 'package:habit_tracking/features/starting%20page/presentation/widgets/label_btn.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../core/utlis/text_string.dart';
// import '../../notification/notification_view.dart';
//
// class RegisterView extends StatelessWidget {
//   RegisterView({super.key});
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   final UserService userService = UserService();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 40),
//               const ArrowBtn(),
//               TitleAndSubtitle(
//                 title: TTexts.registerTitle,
//                 subTitle: TTexts.registerSubTitle,
//               ),
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     TextFieldField(
//                       hintLabel: 'Enter your username',
//                       label: 'Username',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Enter a valid username';
//                         }
//                         return null;
//                       },
//                       controller: usernameController,
//                     ),
//                     const SizedBox(height: 16),
//                     TextFieldField(
//                       hintLabel: 'Enter your email',
//                       label: 'Email',
//                       validator: (value) {
//                         if (value == null || value.isEmpty ||
//                             !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                           return 'Enter a valid email';
//                         }
//                         return null;
//                       },
//                       controller: emailController,
//                     ),
//                     const SizedBox(height: 16),
//                     PasswordField(
//                       hintLabel: 'Enter your password',
//                       label: 'Password',
//                       helperText: 'Must be at least 8 characters',
//                       obsecure: true,
//                       validate: (p0) {
//                         if (p0!.isEmpty || p0.length < 8) {
//                           return "Password must be at least 8 characters long.";
//                         }
//                         return null;
//                       },
//                       controller: passwordController,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 60),
//               CtaBtn(
//                 label: 'Continue',
//                 onClick: () async {
//                   if (_formKey.currentState!.validate()) {
//                     UserModel user = UserModel(
//                       username: usernameController.text,
//                       email: emailController.text,
//                       password: passwordController.text,
//                     );
//
//                     // Save user data using Shared Preferences
//                     SharedPreferences prefs = await SharedPreferences.getInstance();
//                     await prefs.setString('username', user.username);
//                     await prefs.setString('email', user.email);
//                     await prefs.setString('password', user.password);
//
//                     // Optionally save user data using your service
//                     userService.saveUserData(user);
//
//                     // Navigate to the next screen
//                     Navigator.push(context, MaterialPageRoute(
//                       builder: (context) {
//                         return const NotificationView();
//                       },
//                     ));
//                   }
//                 },
//               ),
//               const SizedBox(height: 16),
//               CtaWithLabel(
//                 label: 'Sign up with Google',
//                 onPressed: () {
//                   // Handle Google sign-up logic here
//                 },
//               ),
//               const SizedBox(height: 12),
//               LabelBtn(
//                 label: "I’m already have an account",
//                 onClick: () {
//                   Navigator.push(context, MaterialPageRoute(
//                     builder: (context) {
//                       return LoginScreen();
//                     },
//                   ));
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:habit_tracking/core/models/user_model.dart';
import 'package:habit_tracking/core/services/user_service.dart';
import 'package:habit_tracking/features/login%20screen/presentation/login_screen.dart';
import 'package:habit_tracking/features/navigation/main_navigation_page.dart';
import 'package:habit_tracking/features/notification/notification_view.dart';
import 'package:habit_tracking/features/starting%20page/presentation/widgets/cta_btn.dart';
import 'package:habit_tracking/features/starting%20page/presentation/widgets/label_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utlis/text_string.dart';
import '../../login screen/presentation/widgets/arrow_btn.dart';
import '../../login screen/presentation/widgets/cta_with_label.dart';
import '../../login screen/presentation/widgets/password_field.dart';
import '../../login screen/presentation/widgets/text_field_field.dart';
import '../../login screen/presentation/widgets/title_and_subtitle.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              //const ArrowBtn(),
              TitleAndSubtitle(
                title: TTexts.registerTitle,
                subTitle: TTexts.registerSubTitle,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFieldField(
                      hintLabel: 'Enter your username',
                      label: 'Username',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a valid username';
                        }
                        return null;
                      },
                      controller: usernameController,
                    ),
                    const SizedBox(height: 16),
                    TextFieldField(
                      hintLabel: 'Enter your email',
                      label: 'Email',
                      validator: (value) {
                        if (value == null || value.isEmpty ||
                            !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                      controller: emailController,
                    ),
                    const SizedBox(height: 16),
                    PasswordField(
                      hintLabel: 'Enter your password',
                      label: 'Password',
                      helperText: 'Must be at least 8 characters',
                      obsecure: true,
                      validate: (value) {
                        if (value!.isEmpty || value.length < 8) {
                          return "Password must be at least 8 characters long.";
                        }
                        return null;
                      },
                      controller: passwordController,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              CtaBtn(
                label: 'Continue',
                onClick: () async {
                  if (_formKey.currentState!.validate()) {
                    UserModel user = UserModel(
                      username: usernameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    // Save user data using Shared Preferences
                    await userService.saveUserData(user);

                    // Navigate to the next screen
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return  MainNavigationPage();
                      },
                    ));
                  }
                },
              ),
              const SizedBox(height: 16),
              // CtaWithLabel(
              //   label: 'Sign up with Google',
              //   onPressed: () {
              //     // Handle Google sign-up logic here
              //   },
              // ),
              // const SizedBox(height: 12),
              LabelBtn(
                label: "I’m already have an account",
                onClick: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
