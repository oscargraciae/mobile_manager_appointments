import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioInstance {
  Dio _client = new Dio();

  DioInstance() {
    // _client = new Dio(); // with default Options

    // Set default configs
    // _client.options.baseUrl = "https://api.reserly.mx/api/manager_v1";
    // _client.options.baseUrl = "http://localhost:8001/api/manager_v1";
    _client.options.baseUrl = "http://192.168.0.2:8001/api/manager_v1";
    _client.options.connectTimeout = 5000; //5s
    _client.options.receiveTimeout = 3000;

    _client.interceptors.add(LogInterceptor(responseBody: true));
    // _client.interceptors.add(CookieManager(PersistCookieJar( dir:"./cookies" )));
    _client.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // var token = prefs.getString("qid");
          GetStorage box = GetStorage();
          _client.interceptors.requestLock.lock();
          options.headers["cookie"] = box.read('qid');
          _client.interceptors.requestLock.unlock();

          return handler.next(options);
        },
        onResponse:(response,handler) {
          return handler.next(response); // continue
        },
        onError: (DioError e, handler) async {
          GetStorage box = GetStorage();
          if (e.response!.statusCode == 401) {
            box.remove('qid');
            Get.offAllNamed('/landing');
          }
          return  handler.next(e);//continue
        }
    ));
  }

  Dio get instance => _client;

}