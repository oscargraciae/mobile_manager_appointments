// To parse this JSON data, do
//
//     final UserResponse = UserResponseFromJson(jsonString);

import 'dart:convert';

import 'package:reserly_manager/models/business_user.dart';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse({
    required this.success,
    this.message,
    this.user,
  });

  String? message;
  bool success;
  User? user;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    success: json["success"],
    message: json["message"],
    user: json["user"] != null ? User.fromJson(json["user"]) : null,
  );

  Map<String, dynamic> toJson() => {
    // "success": success,
    "message": message,
    "user": user!.toJson(),
  };
}

class User {
  User({
    this.createdAt,
    this.updatedAt,
    this.id,
    required this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.businessUser,
  });

  DateTime? createdAt;
  DateTime? updatedAt;
  int? id;
  String email;
  String? password;
  String? firstName;
  String? lastName;

  BusinessUser? businessUser;

  factory User.fromJson(Map<String, dynamic> json) => User(
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    id: json["id"],
    email: json["email"],
    password: json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    businessUser: json["businessUser"] != null ? BusinessUser.fromJson(json["businessUser"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "id": id,
    "email": email,
    "password": password,
    "firstName": firstName,
    "lastName": lastName,
    "businessUser": businessUser,
  };
}
