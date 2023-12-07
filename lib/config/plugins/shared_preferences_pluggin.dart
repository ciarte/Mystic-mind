import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencePluggin {
  static Future<SharedPreferences> _prefs() {
    return SharedPreferences.getInstance();
  }

  static Future<void> setString(key, value) async {
    final prefs = await _prefs();
    await prefs.setString(key, value);
  }

  static Future<String> getString(key) async {
    final prefs = await _prefs();
    return prefs.getString(key) ?? '';
  }
}
