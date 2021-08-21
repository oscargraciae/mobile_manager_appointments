import 'dart:convert';

import 'package:reserly_manager/models/business.dart';

BusinessUser businessUserFromJson(String str) => BusinessUser.fromJson(json.decode(str));

String businessUserToJson(BusinessUser data) => json.encode(data.toJson());

class BusinessUser {
  BusinessUser({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.userId,
    required this.businessId,
    // required this.business,
  });

  DateTime createdAt;
  DateTime updatedAt;
  int id;
  int userId;
  int businessId;
  // Business business;

  factory BusinessUser.fromJson(Map<String, dynamic> json) => BusinessUser(
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    id: json["id"],
    userId: json["userId"],
    businessId: json["businessId"],
    // business: Business.fromJson(json["business"]),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "id": id,
    "userId": userId,
    "businessId": businessId,
    // "business": business.toJson(),
  };
}

