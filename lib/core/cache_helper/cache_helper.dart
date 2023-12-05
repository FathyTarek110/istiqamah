
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static  insertText({required String key, required String value}) async{
   await sharedPreferences.setString(key, value);
  }

  static returnText({required String key}) {
    return  sharedPreferences.getString(key);
  }

  static  insertInt({required String key, required int value}) async{
   await sharedPreferences.setInt(key, value);
  }

  static returnInt({required String key}) {
    return sharedPreferences.getInt(key);
  }

  static  insertBool({required String key, required bool value})async {
   await sharedPreferences.setBool(key, value);
  }

  static  returnBool({required String key}) {
    return sharedPreferences.getBool(key);
  }
}