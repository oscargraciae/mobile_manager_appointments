class BookingStatus {
  BookingStatus({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory BookingStatus.fromJson(Map<String, dynamic> json) => BookingStatus(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
