

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/arrow_btn.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/cta_with_label.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/password_field.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/text_field_field.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/title_and_subtitle.dart';
// import 'package:habit_tracking/features/notification/notification_view.dart';
// import 'package:habit_tracking/features/register/presentation/register_view.dart';
// import 'package:habit_tracking/features/starting%20page/presentation/widgets/cta_btn.dart';
// import 'package:habit_tracking/features/starting%20page/presentation/widgets/label_btn.dart';
// import '../../../core/utlis/text_string.dart';
//
// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView( // Use ListView for scrolling
//         padding: const EdgeInsets.all(16.0), // Add padding to the ListView
//         children: [
//           const SizedBox(height: 40),
//           const Align(
//             alignment: Alignment.centerLeft,
//             child:ArrowBtn(),
//           ),
//           Align(
//             alignment: Alignment.centerLeft,
//             child:TitleAndSubtitle(
//               title: TTexts.loginTitle,
//               subTitle: TTexts.loginSubTitle,
//             ),
//           ),
//
//           // Form for validation
//           Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Text fields
//                 TextFieldField(
//                   hintLabel: 'Enter your username',
//                   label: 'User name',
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Enter a valid username';
//                     }
//                     if (value.length < 5) {
//                       return 'Username must be at least 5 characters';
//                     }
//                     return null; // Return null if the input is valid
//                   },
//                   controller: usernameController,
//                 ),
//                 const SizedBox(height: 16),
//                 PasswordField(
//                   hintLabel: "Enter your password",
//                   label: 'Password',
//                   helperText: 'Forget your password?',
//                   obsecure: true,
//                   validate: (p0) {
//                     if (p0!.isEmpty) {
//                       return "Enter your password";
//                     }
//                     if (p0.length < 8) {
//                       return "Enter strong password ";
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height:80), // Adjust this height as needed
//               ],
//             ),
//           ),
//
//           // CTA buttons
//           CtaBtn(
//             label: 'Continue',
//             onClick: () {
//               if (_formKey.currentState!.validate()) {
//                 _login(context);
//
//               }
//               Navigator.push(context, MaterialPageRoute(
//                 builder: (context) {
//                   return const NotificationView();
//                 },
//               ));
//             },
//           ),
//           const SizedBox(height: 16),
//           CtaWithLabel(
//             label: 'Signed in with Google',
//             onPressed: () {
//               // Handle Google sign-in logic here
//             },
//           ),
//           const SizedBox(height: 12),
//           LabelBtn(
//             label: "Don’t have an account? Sign up",
//             onClick: () {
//               Navigator.push(context, MaterialPageRoute(
//                 builder: (context) {
//                   return RegisterView();
//                 },
//               ));
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_tracking/core/models/user_model.dart';
import 'package:habit_tracking/core/services/user_service.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/arrow_btn.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/cta_with_label.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/password_field.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/text_field_field.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/title_and_subtitle.dart';
import 'package:habit_tracking/features/notification/notification_view.dart';
import 'package:habit_tracking/features/register/presentation/register_view.dart';
import 'package:habit_tracking/features/starting%20page/presentation/widgets/cta_btn.dart';
import 'package:habit_tracking/features/starting%20page/presentation/widgets/label_btn.dart';
import '../../../core/utlis/text_string.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 40),
          const Align(
            alignment: Alignment.centerLeft,
            child: ArrowBtn(),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TitleAndSubtitle(
              title: TTexts.loginTitle,
              subTitle: TTexts.loginSubTitle,
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldField(
                  hintLabel: 'Enter your username',
                  label: 'User name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a valid username';
                    }
                    return null;
                  },
                  controller: usernameController,
                ),
                const SizedBox(height: 16),
                PasswordField(
                  hintLabel: "Enter your password",
                  label: 'Password',
                  helperText: 'Forget your password?',
                  obsecure: true,
                  validate: (p0) {
                    if (p0!.isEmpty) {
                      return "Enter your password";
                    }
                    return null;
                  },
                  controller: passwordController,
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
          CtaBtn(
            label: 'Continue',
            onClick: () {
              if (_formKey.currentState!.validate()) {
                _login(context);
              }
            },
          ),
          const SizedBox(height: 16),
          CtaWithLabel(
            label: 'Signed in with Google',
            onPressed: () {
              // Handle Google sign-in logic here
            },
          ),
          const SizedBox(height: 12),
          LabelBtn(
            label: "Don’t have an account? Sign up",
            onClick: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return RegisterView();
                },
              ));
            },
          ),
        ],
      ),
    );
  }

  void _login(BuildContext context) {
    String username = usernameController.text;
    String password = passwordController.text;

    // Fetch user data from local storage
    UserModel? user = userService.getUserData() as UserModel?;

    // Validate login
    if (user != null && user.username == username && user.password == password) {
      // Navigate to NotificationView
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NotificationView()),
      );
    } else {
      // Show error message
      _showErrorDialog(context, 'Invalid username or password.');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
