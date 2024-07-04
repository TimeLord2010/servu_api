import 'dart:convert';

class User {
  final String? name;
  final String email;
  final String? password;

  User({
    required this.name,
    required this.email,
    this.password,
  });

  factory User.fromJson(String json) {
    return User.fromMap(jsonDecode(json));
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'],
      name: map['name'],
      password: map['password'],
    );
  }

  Map<String, dynamic> get toMap {
    return {
      'name': name,
      'email': email,
      if (password != null) 'password': password,
    };
  }

  String get toJson {
    return jsonEncode(toMap);
  }
}
