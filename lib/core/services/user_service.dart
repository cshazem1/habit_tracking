import 'package:shared_preferences/shared_preferences.dart';
import 'package:habit_tracking/core/models/user_model.dart';

class UserService {
  Future<void> saveUserData(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userData', user.toJson());
  }

 static Future<UserModel?> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('userData');

    if (userData != null) {
      return UserModel.fromJson(userData);
    }
    return null;
  }
}
