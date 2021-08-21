import 'package:dio/dio.dart';
import 'package:reserly_manager/instances/dio_instance.dart';
import 'package:reserly_manager/models/booking.dart';

class BookingService {
  static Future<BookingsResponse> getAll({ required int status, required DateTime endDate }) async {
    try {
      var dio = new DioInstance().instance;
      final response = await dio.get('/bookings', queryParameters: {
        "status": status,
        "dateEnd": endDate,
      });
      return BookingsResponse.fromJson(response.data);
    } on DioError {
      // return BookingsResponse(success: false);
      throw 'Error';
    }  
  }


  static Future<BookingResponse> get(int id) async {
    try {
      var dio = new DioInstance().instance;
      final response = await dio.get('/bookings/$id');
      return BookingResponse.fromJson(response.data);
    } on DioError {
      return BookingResponse(success: false);
    }  
  }

  static Future<dynamic> toAccept(int id) async {
    try {
      var dio = new DioInstance().instance;
      final response = await dio.put('/bookings/$id/accepted');
      print(response.data);
      return response.data;
      // return BookingResponse.fromJson(response.data);
    } on DioError {
      return BookingResponse(success: false);
    }  
  }

  static Future<dynamic> toCancel(int id) async {
    try {
      var dio = new DioInstance().instance;
      final response = await dio.put('/bookings/$id/canceled');
      print(response.data);
      return response.data;
      // return BookingResponse.fromJson(response.data);
    } on DioError {
      return BookingResponse(success: false);
    }  
  }
}