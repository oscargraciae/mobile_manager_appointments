class Customer {
  Customer({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.isActive,
  });

  DateTime? createdAt;
  DateTime? updatedAt;
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? phone;
  bool? isActive;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    id: json["id"],
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    phone: json["phone"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "id": id,
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "phone": phone,
    "isActive": isActive,
  };
}