import 'package:reserly_manager/models/business_service.dart';

class BookingService {
  BookingService({
    this.id,
    this.nameService,
    this.priceService,
    this.timeService,
    this.bookingId,
    this.businessServiceId,
    this.businessService,
  });

  int id;
  String nameService;
  String priceService;
  int timeService;
  int bookingId;
  int businessServiceId;
  BusinessService businessService;

  factory BookingService.fromJson(Map<String, dynamic> json) => BookingService(
        id: json["id"],
        nameService: json["nameService"],
        priceService: json["priceService"],
        timeService: json["timeService"],
        bookingId: json["bookingId"],
        businessServiceId: json["businessServiceId"],
        businessService: BusinessService.fromJson(json["businessService"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameService": nameService,
        "priceService": priceService,
        "timeService": timeService,
        "bookingId": bookingId,
        "businessServiceId": businessServiceId,
        "businessService": businessService.toJson(),
      };
}

