import 'dart:convert';

ServiceResponse serviceResponseFromJson(String str) => ServiceResponse.fromJson(json.decode(str));

String serviceResponseToJson(ServiceResponse data) => json.encode(data.toJson());

class ServiceResponse {
  ServiceResponse({
    required this.success,
    required this.services,
  });

  bool success;
  List<Service> services;

  factory ServiceResponse.fromJson(Map<String, dynamic> json) => ServiceResponse(
    success: json["success"],
    services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "services": List<dynamic>.from(services.map((x) => x.toJson())),
  };
}

class Service {
  Service({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.time,
    required this.businessId,
    required this.isActive,
  });

  DateTime createdAt;
  DateTime updatedAt;
  int id;
  String name;
  String? description;
  String price;
  int time;
  int businessId;
  bool isActive;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    time: json["time"],
    businessId: json["businessId"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "time": time,
    "businessId": businessId,
    "isActive": isActive,
  };
}
