import 'package:dio/dio.dart';
import 'package:reserly_manager/instances/dio_instance.dart';
import 'package:reserly_manager/models/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicesService {
  Future<ServiceResponse> getAll() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      Dio dio = DioInstance().instance;

      final response = await dio.get('/businesses/${pref.get('businessId')}/services');
      return ServiceResponse.fromJson(response.data);
    } catch(error) {
      throw error;
    }
  }

  Future<bool> create({ required String name, required double price, required int time }) async {
    try {
      Dio dio = DioInstance().instance;
      SharedPreferences pref = await SharedPreferences.getInstance();

      final reponse = await dio.post('/businesses/${pref.get('businessId')}/services', data: {
        "name": name,
        "price": price,
        "time": time
      });

      return reponse.data['success'];
    } catch(error) {
      throw error;
    }
  }

  Future<bool> update({required int id, required String name, required double price, required int time }) async {
    try {
      Dio dio = DioInstance().instance;
      SharedPreferences pref = await SharedPreferences.getInstance();

      final reponse = await dio.put('/businesses/${pref.get('businessId')}/services/$id', data: {
        "name": name,
        "price": price,
        "time": time
      });

      return reponse.data['success'];
    } catch(error) {
      throw error;
    }
  }

  Future<bool> delete(int id) async {
    try {
      Dio dio = DioInstance().instance;
      SharedPreferences pref = await SharedPreferences.getInstance();

      final response = await dio.delete('/businesses/${pref.get('businessId')}/services/$id');

      return response.data['success'];

    } catch(error) {
      throw error;
    }
  }
}