class BusinessService {
  BusinessService({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.name,
    this.description,
    this.price,
    this.time,
    this.businessId,
    this.isActive,
  });

  DateTime createdAt;
  DateTime updatedAt;
  int id;
  String name;
  String description;
  String price;
  int time;
  int businessId;
  bool isActive;

  factory BusinessService.fromJson(Map<String, dynamic> json) =>
    BusinessService(
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
