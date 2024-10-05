
// import 'package:flutter/material.dart';
// import 'package:habit_tracking/core/models/user_model.dart';
// import 'package:habit_tracking/core/services/user_service.dart';
// import 'package:habit_tracking/features/home/presentation/screens/home_view.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/login_screen.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/arrow_btn.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/cta_with_label.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/password_field.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/text_field_field.dart';
// import 'package:habit_tracking/features/login%20screen/presentation/widgets/title_and_subtitle.dart';
// import 'package:habit_tracking/features/notification/notification_view.dart';
// import 'package:habit_tracking/features/starting%20page/presentation/widgets/cta_btn.dart';
// import 'package:habit_tracking/features/starting%20page/presentation/widgets/label_btn.dart';
// import '../../../core/utlis/text_string.dart';
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
//       body: SingleChildScrollView( // Make the body scrollable
//         child: Padding(
//           padding: const EdgeInsets.all(16.0), // Use consistent padding
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 40),
//               const ArrowBtn(),
//
//               TitleAndSubtitle(
//                 title: TTexts.registerTitle,
//                 subTitle: TTexts.registerSubTitle,
//               ),
//
//               Form( // Wrap text fields in a Form widget for validation
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     // Text fields
//                     TextFieldField(
//                       hintLabel: 'Enter your username',
//                       label: 'Username',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Enter a valid username';
//                         }
//                         // Check for two separate names
//                         final names = value.split(' ');
//                         if (names.length != 2) {
//                           return 'Username must consist of two separate names';
//                         }
//                         // Check if each name contains only letters
//                         for (var name in names) {
//                           if (!RegExp(r'^[a-zA-Z]+$').hasMatch(name)) {
//                             return 'Names can only contain letters';
//                           }
//                         }
//                         return null; // Return null if the input is valid
//                       },
//                       controller: usernameController,
//                     ),
//                     const SizedBox(height: 16),
//                     TextFieldField(
//                       hintLabel: 'Enter your email',
//                       label: 'Email',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Enter a valid email';
//                         }
//                         // Regex for validating email
//                         if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
//                           return 'Enter a valid email address';
//                         }
//                         return null; // Return null if the input is valid
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
//                         if (p0!.isEmpty) {
//                           return "Enter your password";
//                         }
//                         if (p0.length < 8) {
//                           return "Password must be at least 8 characters long.";
//                         }
//                         // Regex to check for at least one letter, one number, and one special character
//                         if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$%^&*()!+=-])[A-Za-z\d@$%^&*()!+=-]+$').hasMatch(p0)) {
//                           return "Password must contain letters,\n numbers, and special characters.";
//                         }
//                         return null; // Return null if the input is valid
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//
//               // CTA buttons
//               const SizedBox(height: 60),
//               CtaBtn(
//                 label: 'Continue',
//                 onClick: () {
//                   if (_formKey.currentState!.validate()) {
//                     // Create a UserModel and save the data
//                     UserModel user = UserModel(
//                       username: usernameController.text,
//                       email: emailController.text,
//                       password: passwordController.text,
//                     );
//
//                     // Save the user data using the service
//                     userService.saveUserData(user);
//
//                     // Handle registration logic here (e.g., navigate to another screen)
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
import 'package:habit_tracking/features/home/presentation/screens/home_view.dart';
import 'package:habit_tracking/features/login%20screen/presentation/login_screen.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/arrow_btn.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/cta_with_label.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/password_field.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/text_field_field.dart';
import 'package:habit_tracking/features/login%20screen/presentation/widgets/title_and_subtitle.dart';
import 'package:habit_tracking/features/starting%20page/presentation/widgets/cta_btn.dart';
import 'package:habit_tracking/features/starting%20page/presentation/widgets/label_btn.dart';
import '../../../core/utlis/text_string.dart';
import '../../notification/notification_view.dart';

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
              const ArrowBtn(),
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
                      validate: (p0) {
                        if (p0!.isEmpty || p0.length < 8) {
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
                onClick: () {
                  if (_formKey.currentState!.validate()) {
                    UserModel user = UserModel(
                      username: usernameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    userService.saveUserData(user);
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const NotificationView();
                      },
                    ));
                  }
                },
              ),
              const SizedBox(height: 16),
              CtaWithLabel(
                label: 'Sign up with Google',
                onPressed: () {
                  // Handle Google sign-up logic here
                },
              ),
              const SizedBox(height: 12),
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



