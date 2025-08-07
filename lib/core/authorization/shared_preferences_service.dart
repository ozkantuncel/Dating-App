import 'package:dating_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _sharedPreferences = locator<SharedPreferences>();
  final String _firstRunKey = "firstRun";

  Future<void> createFirstRunKey() async {
    await _sharedPreferences.setBool(_firstRunKey, true);
  }

  Future<bool> isFirstRunKeyExist() async {
    return await _sharedPreferences.containsKey(_firstRunKey);
  }
}
