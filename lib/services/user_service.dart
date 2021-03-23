import 'package:dio/dio.dart';
import 'package:reserly_manager/instances/dio_instance.dart';
import 'package:reserly_manager/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  String aToken = '';

  Future<UserResponse> login(String email, String password) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Dio dio = DioInstance().instance;

      final response = await dio.post('/users/auth', data: {
        "email": email,
        "password": password,
      });
      
      final cookies = response.headers.map['set-cookie'];
        if (cookies.isNotEmpty) {
          final authToken = cookies[0].split(';')[0]; //it depends on how your server sending cookie
          prefs.setString('qid', authToken);
        }
      
      return UserResponse.fromJson(response.data);
    } catch (e) {
      // throw e;
      return UserResponse(success: false, message: 'No se ha podido iniciar sesión');
    }
  }

  Future<UserResponse> getCustomers() async {
    try {
      Dio dio = DioInstance().instance;
      final response = await dio.get('/customers');
      print(response);

      return UserResponse.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }
}