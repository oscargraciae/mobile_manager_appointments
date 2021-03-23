import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioInstance {
  Dio _client;

  

  DioInstance() {
    print('Constructor');
    _client = new Dio(); // with default Options

    // Set default configs
    _client.options.baseUrl = "https://api.reserly.mx/api/manager_v1";
    // _client.options.baseUrl = "http://localhost:8001/api/manager_v1";
    _client.options.connectTimeout = 5000; //5s
    _client.options.receiveTimeout = 3000;
    // _client.request.

    _client.interceptors.add(LogInterceptor(responseBody: false)); //开启请求日志
    _client.interceptors.add(InterceptorsWrapper(onError: _onError)); //开启请求日志
    // _client.interceptors.add(CookieManager(PersistCookieJar( dir:"./cookies" )));
    _client.interceptors.add(InterceptorsWrapper(
        onRequest:(Options options) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var token = prefs.getString("qid");
          if (token != null) {
            _client.interceptors.requestLock.lock();
            options.headers["cookie"] = prefs.getString('qid');
            _client.interceptors.requestLock.unlock();  
          }
          
          return options; //continue
        }
    ));

    // // or new Dio with a BaseOptions instance.
    // BaseOptions options = new BaseOptions(
    //     baseUrl: "https://www.xx.com/api",
    //     connectTimeout: 5000,
    //     receiveTimeout: 3000,
    // );
  }

  Dio get instance => _client;

  _onError(DioError error) {
    print('_OnError');
    print(error);
    // return error;
  }
}