
import 'package:dating_app/core/authorization/secure_storage_service.dart';
import 'package:dating_app/injection_container.dart';
import 'package:flutter/material.dart';

class AuthManager extends ChangeNotifier {

  final SecureStorageService _storageService = locator<SecureStorageService>();

  final navigatorKey = GlobalKey<NavigatorState>();

  Future<bool?>? isTokenNull() async {
    notifyListeners();
    final token = await _storageService.getToken();

    return token != null && token.isNotEmpty;
  }
}
