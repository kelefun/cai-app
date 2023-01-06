import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// 枚举类型 - 请求类型
enum HttpType { HttpTypeGet, HttpTypePost }

class DioManager {
  static late final DioManager instance = DioManager._internal();
  static late Dio _dio;

  DioManager._internal() {
    var options = BaseOptions(
      baseUrl: dotenv.get('APP_BASE_URL'),
      connectTimeout: 10000,
      receiveTimeout: 5000,
    );
    _dio = Dio(options);
    _dio.interceptors.add(LogInterceptor());
  }

  factory DioManager() => instance;

  Dio dio(){
    return _dio;
  }
}
