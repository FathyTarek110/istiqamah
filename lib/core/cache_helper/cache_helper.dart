import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void insertText({required String key, required String value}) {
    sharedPreferences.setString(key, value);
  }

  static String? returnText({required String key}) {
    return sharedPreferences.getString(key);
  }

  static void insertBool({required String key, required bool value}) {
    sharedPreferences.setBool(key, value);
  }

  static String? returnBool({required String key}) {
    return sharedPreferences.getString(key);
  }
}