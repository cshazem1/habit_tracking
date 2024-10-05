// import 'package:shared_preferences/shared_preferences.dart';
// import '../models/user_model.dart';
//
// class UserService {
//   // Method to save user data
//   Future<void> saveUserData(UserModel user) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('username', user.username);
//     await prefs.setString('email', user.email);
//     await prefs.setString('password',
//         user.password);
//   }
// }
//
// // Method to retrieve user data
// Future<UserModel?> getUserData() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? username = prefs.getString('username');
//   String? email = prefs.getString('email');
//   String? password = prefs.getString('password');
//
//   if (username != null && email != null && password != null) {
//     return UserModel(username: username, email: email, password: password);
//   }
//   return null;
// }

import 'package:shared_preferences/shared_preferences.dart';
import 'package:habit_tracking/core/models/user_model.dart';

class UserService {
  Future<void> saveUserData(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userData', user.toJson());
  }

  Future<UserModel?> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('userData');

    if (userData != null) {
      return UserModel.fromJson(userData);
    }
    return null;
  }
}
