import 'package:dio/dio.dart';
import 'package:reserly_manager/instances/dio_instance.dart';
import 'package:reserly_manager/models/booking.dart';

class BookingService {
  static Future<BookingsResponse> getAll({int status, DateTime endDate, DateTime startDate}) async {
    try {
      var dio = new DioInstance().instance;
      final response = await dio.get('/bookings', queryParameters: {
        "status": status,
        "dateEnd": endDate,
        'startDate': startDate,
      });
      // print('Clientes===> $status ----- ${response.data['bookings'][0]}');
      return BookingsResponse.fromJson(response.data);
    } on DioError {
      return BookingsResponse(success: false);
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