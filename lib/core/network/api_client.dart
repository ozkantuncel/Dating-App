import 'package:dating_app/core/network/interceptors/logger_interceptor.dart';
import 'package:dating_app/core/network/utlis/http_client_init.dart';
import 'package:dating_app/injection_container.dart';
import 'package:dio/dio.dart';

import 'interceptors/auth_interceptors.dart';

class ApiClient implements HttpClientInterface {
  ApiClient() {
    _dio.interceptors.add(LoggerInterceptor());
    _dio.interceptors.add(AuthInterceptors());
  }

  final Dio _dio = locator<Dio>();

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get(path, queryParameters: queryParameters);
  }

  @override
  Future<Response<T>> post<T>(String path, {Map<String, dynamic>? data}) {
    return _dio.post(path, data: data);
  }

  @override
  Future<Response<T>> postSingle<T>(String path, {data}) {
    return _dio.post(path, data: data);
  }
}
