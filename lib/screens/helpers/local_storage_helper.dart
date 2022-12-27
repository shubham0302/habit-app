import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageHelper {
  static setItem(String key, String val) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, val);
    return true;
  }

  static getItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final String? val = prefs.getString(key);
    return val;
  }

  static removeItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}