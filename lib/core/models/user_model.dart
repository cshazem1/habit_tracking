import 'dart:convert';

class UserModel {
  final String username;
  final String email;
  final String password;

  UserModel({
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'],
      email: map['email'],
      password: map['password'],
    );
  }

  factory UserModel.fromJson(String source) {
    final Map<String, dynamic> map = jsonDecode(source);
    return UserModel.fromMap(map);
  }
}
