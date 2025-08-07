import 'package:dio/dio.dart';
import 'package:dating_app/core/authorization/secure_storage_service.dart';
import 'package:dating_app/injection_container.dart';

class AuthInterceptors extends Interceptor {
  final SecureStorageService _storageService = locator<SecureStorageService>();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storageService.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = token;
    }
    super.onRequest(options, handler);
  }
}
