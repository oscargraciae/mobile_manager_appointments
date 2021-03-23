import 'dart:convert';

import 'package:reserly_manager/models/booking_service.dart';
import 'package:reserly_manager/models/booking_status.dart';
import 'package:reserly_manager/models/customer.dart';

BookingsResponse bookingsResponseFromJson(String str) => BookingsResponse.fromJson(json.decode(str));

String bookingsResponseToJson(BookingsResponse data) => json.encode(data.toJson());

class BookingsResponse {
  BookingsResponse({
    this.success,
    this.bookings,
  });

  bool success;
  List<Booking> bookings;

  factory BookingsResponse.fromJson(Map<String, dynamic> json) => BookingsResponse(
    success: json["success"],
    bookings: List<Booking>.from(
      json["bookings"].map((x) => Booking.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "bookings": List<dynamic>.from(bookings.map((x) => x.toJson())),
  };
}

class BookingResponse {
  BookingResponse({
    this.success,
    this.booking,
  });

  bool success;
  Booking booking;

  factory BookingResponse.fromJson(Map<String, dynamic> json) => BookingResponse(
    success: json["success"],
    booking: Booking.fromJson(json['booking'])
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "bookings": booking.toJson(),
  };
}

class Booking {
  Booking({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.bookingDate,
    this.bookingTime,
    this.message,
    this.isActive,
    this.totalTime,
    this.totalPrice,
    this.customerId,
    this.businessId,
    this.bookingStatusId,
    this.customer,
    this.bookingStatus,
    this.bookingService,
  });

  DateTime createdAt;
  DateTime updatedAt;
  int id;
  DateTime bookingDate;
  String bookingTime;
  String message;
  bool isActive;
  int totalTime;
  int totalPrice;
  int customerId;
  int businessId;
  int bookingStatusId;
  Customer customer;
  BookingStatus bookingStatus;
  List<BookingService> bookingService;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    id: json["id"],
    bookingDate: DateTime.parse(json["bookingDate"]),
    bookingTime: json["bookingTime"],
    message: json["message"],
    isActive: json["isActive"],
    totalTime: json["totalTime"],
    totalPrice: json["totalPrice"],
    customerId: json["customerId"],
    businessId: json["businessId"],
    bookingStatusId: json["bookingStatusId"],
    customer: Customer.fromJson(json["customer"]),
    bookingStatus: BookingStatus.fromJson(json["bookingStatus"]),
    bookingService: json["bookingService"] != null ? List<BookingService>.from(json["bookingService"].map((x) => BookingService.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
        "bookingDate": bookingDate.toIso8601String(),
        "bookingTime": bookingTime,
        "message": message,
        "isActive": isActive,
        "totalTime": totalTime,
        "totalPrice": totalPrice,
        "customerId": customerId,
        "businessId": businessId,
        "bookingStatusId": bookingStatusId,
        "customer": customer.toJson(),
        "bookingStatus": bookingStatus.toJson(),
        "bookingService": List<dynamic>.from(bookingService.map((x) => x.toJson())),
      };
}
