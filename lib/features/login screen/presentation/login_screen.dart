// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:habit_tracking/core/models/user_model.dart';
// import 'package:habit_tracking/core/services/user_service.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/arrow_btn.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/cta_with_label.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/password_field.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/text_field_field.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/title_and_subtitle.dart';
// import 'package:habit_tracking/features/notification/notification_view.dart';
// import 'package:habit_tracking/features/register/presentation/register_view.dart';
// import 'package:habit_tracking/features/starting%20page/presentation/widgets/cta_btn.dart';
// import 'package:habit_tracking/features/starting%20page/presentation/widgets/label_btn.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../core/utlis/text_string.dart';
// import '../../home/presentation/screens/home_view.dart';
//
// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   final UserService userService = UserService();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: [
//           const SizedBox(height: 40),
//           const Align(
//             alignment: Alignment.centerLeft,
//             child: ArrowBtn(),
//           ),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: TitleAndSubtitle(
//               title: TTexts.loginTitle,
//               subTitle: TTexts.loginSubTitle,
//             ),
//           ),
//           Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextFieldField(
//                   hintLabel: 'Enter your username',
//                   label: 'User name',
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Enter a valid username';
//                     }
//                     return null;
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
//                     return null;
//                   },
//                   controller: passwordController,
//                 ),
//                 const SizedBox(height: 80),
//               ],
//             ),
//           ),
//           CtaBtn(
//             label: 'Continue',
//             onClick: () {
//               if (_formKey.currentState!.validate()) {
//                 _login(context);
//               }
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
//
//   Future<void> _login(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? storedUsername = prefs.getString('username');
//     String? storedPassword = prefs.getString('password');
//
//     if (usernameController.text == storedUsername &&
//         passwordController.text == storedPassword) {
//       // Successful login
//       Navigator.pushReplacement(context, MaterialPageRoute(
//         builder: (context) {
//           return const NotificationView(); // Navigate to your home screen
//         },
//       ));
//     } else {
//       // Show an error message
//       _showErrorDialog(context);
//     }
//   }
//
//   void _showErrorDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text("Login Failed"),
//           content: const Text("Invalid username or password."),
//           actions: <Widget>[
//             TextButton(
//               child: const Text("OK"),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Dismiss the dialog
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:habit_tracking/core/models/user_model.dart';
import 'package:habit_tracking/core/services/user_service.dart';
import 'package:habit_tracking/features/register/presentation/register_view.dart';
import 'package:habit_tracking/features/notification/notification_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utlis/text_string.dart';
import '../../starting page/presentation/widgets/cta_btn.dart';
import '../../starting page/presentation/widgets/label_btn.dart';
import 'widgets/arrow_btn.dart';
import 'widgets/cta_with_label.dart';
import 'widgets/password_field.dart';
import 'widgets/text_field_field.dart';
import 'widgets/title_and_subtitle.dart';


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
          //const ArrowBtn(),
          TitleAndSubtitle(
            title: TTexts.loginTitle,
            subTitle: TTexts.loginSubTitle,
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
                  validate: (value) {
                    if (value!.isEmpty) {
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
            onClick: () async {
              if (_formKey.currentState!.validate()) {
                await _login(context);
              }
            },
          ),
          const SizedBox(height: 16),
          // CtaWithLabel(
          //   label: 'Sign in with Google',
          //   onPressed: () {
          //     // Handle Google sign-in logic here
          //   },
          // ),
          // const SizedBox(height: 12),
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

  Future<void> _login(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUserData = prefs.getString('userData');

    if (storedUserData != null) {
      UserModel storedUser = UserModel.fromJson(storedUserData);
      if (usernameController.text == storedUser.username &&
          passwordController.text == storedUser.password) {
        // Successful login
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const NotificationView();
          },
        ));
      } else {
        _showErrorDialog(context);
      }
    } else {
      _showErrorDialog(context);
    }
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Login Failed"),
          content: const Text("Invalid username or password."),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

