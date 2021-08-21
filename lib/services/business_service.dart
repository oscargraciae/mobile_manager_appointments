import 'package:dio/dio.dart';
import 'package:reserly_manager/instances/dio_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusinessService {
  Future<bool> create({ required String name, required int categoryId, required String addressMap, required double lat, required double lng }) async {
    try {
      Dio dio = DioInstance().instance;
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final response = await dio.post('/businesses', data: {
        "name": name,
        "businessCategoryId": categoryId,
        "addressMap": addressMap,
        "lat": lat,
        "lng": lng
      });
      if (response.data["success"]) {
        prefs.setInt('businessId', response.data["business"]["id"]);
      }
      print('Cuenta creada');
      return response.data["success"];
    } catch(error) {
      throw error;
    }
  }
}