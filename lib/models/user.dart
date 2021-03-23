// To parse this JSON data, do
//
//     final UserResponse = UserResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse({
    this.success,
    this.message,
    this.user,
  });

  String message;
  bool success;
  User user;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    success: json["success"],
    message: json["message"],
    user: json["user"] != null  ? User.fromJson(json["user"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "user": user.toJson(),
  };
}

class User {
  User({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.email,
    this.password,
  });

  DateTime createdAt;
  DateTime updatedAt;
  int id;
  String email;
  String password;

  factory User.fromJson(Map<String, dynamic> json) => User(
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    id: json["id"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "id": id,
    "email": email,
    "password": password,
  };
}
