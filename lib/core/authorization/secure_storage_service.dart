
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final String _tokenValueKey = "userToken";
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<String?> getToken() async {
    final tokenValue = await _secureStorage.read(key: _tokenValueKey);
    return tokenValue;
  }


  Future<void> saveToken(String newToken) async {
    await _secureStorage.write(key: _tokenValueKey, value: newToken);
  }

  Future<void> deleteToken() async {
    await _secureStorage.delete(key: _tokenValueKey);
  }

  Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }
}
