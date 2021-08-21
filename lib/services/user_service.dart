import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reserly_manager/instances/dio_instance.dart';
import 'package:reserly_manager/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<UserResponse> create({
    required String firstName,
    required String lastName,
    required String email,
    required String password
  }) async {
    try {
      Dio dio = DioInstance().instance;
      GetStorage box = GetStorage();

      final response = await dio.post('/users', data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
      });
      UserResponse userResponse = UserResponse.fromJson(response.data);

      if (userResponse.success) {
        final cookies = response.headers.map['set-cookie'];
        final authToken = cookies![0].split(';')[0];

        box.write('qid', authToken);
      }
      return userResponse;

    } catch (error) {
      return UserResponse(success: false, message: 'No se ha registrae');
    }
  }

  Future<UserResponse> login(String email, String password) async {
    try {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      Dio dio = DioInstance().instance;
      GetStorage box = GetStorage();

      final response = await dio.post('/users/auth', data: {
        "email": email,
        "password": password,
      });

      final cookies = response.headers.map['set-cookie'];
      if (cookies != null) {
        final authToken = cookies[0].split(';')[0]; //it depends on how your server sending cookie
        // prefs.setString('qid', authToken);
        box.write('qid', authToken);
      }

      return UserResponse.fromJson(response.data);
    } catch (e) {
      return UserResponse(success: false, message: 'No se ha podido iniciar sesión');
    }
  }

  Future<UserResponse> getMe() async {
    try {
      Dio dio = DioInstance().instance;
      final response = await dio.get('/users');
      print(jsonEncode(response.data));
      return UserResponse.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }
}