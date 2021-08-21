class Business {
  Business({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.name,
    required this.description,
    required this.cover,
    this.phone,
    required this.isActive,
    required this.isCompleted,
    required this.isPublic,
    required this.hasParallelBookings,
    required this.hasBookingConfirmation,
    required this.businessCategoryId,
  });

  DateTime createdAt;
  DateTime updatedAt;
  int id;
  String name;
  String description;
  String cover;
  String? phone;
  bool isActive;
  bool isCompleted;
  bool isPublic;
  bool hasParallelBookings;
  bool hasBookingConfirmation;
  int businessCategoryId;

  factory Business.fromJson(Map<String, dynamic> json) => Business(
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    id: json["id"],
    name: json["name"],
    description: json["description"],
    cover: json["cover"],
    phone: json["phone"] ?? '',
    isActive: json["isActive"],
    isCompleted: json["isCompleted"],
    isPublic: json["isPublic"],
    hasParallelBookings: json["hasParallelBookings"],
    hasBookingConfirmation: json["hasBookingConfirmation"],
    businessCategoryId: json["businessCategoryId"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "id": id,
    "name": name,
    "description": description,
    "cover": cover,
    "phone": phone,
    "isActive": isActive,
    "isCompleted": isCompleted,
    "isPublic": isPublic,
    "hasParallelBookings": hasParallelBookings,
    "hasBookingConfirmation": hasBookingConfirmation,
    "businessCategoryId": businessCategoryId,
  };
}
