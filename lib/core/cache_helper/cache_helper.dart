import 'dart:ffi';

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

  static void insertInt({required String key, required int value}) {
    sharedPreferences.setInt(key, value);
  }

  static int? returnInt({required String key}) {
    return sharedPreferences.getInt(key);
  }

  static void insertBool({required String key, required bool value}) {
    sharedPreferences.setBool(key, value);
  }

  static bool? returnBool({required String key}) {
    return sharedPreferences.getBool(key);
  }
}