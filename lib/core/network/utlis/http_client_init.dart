import 'package:dio/dio.dart';

abstract class HttpClientInterface {
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });
  Future<Response<T>> post<T>(String path, {Map<String, dynamic>? data});
  Future<Response<T>> postSingle<T>(String path, {dynamic data});
}
