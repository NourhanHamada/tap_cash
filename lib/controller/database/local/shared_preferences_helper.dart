import 'package:shared_preferences/shared_preferences.dart';
/*
  1. declare.
  2. assignment.
  3. Methods ( set - get - delete - clear ).
*/

class SharedHelper {
  static late SharedPreferences
      sharedPreferences; // declare sharedPreferences variable.
  static sharedInitialize() async {
    sharedPreferences = await SharedPreferences
        .getInstance(); // assignment an Instance to shred variable.
  }

// Methods.
// 1- Set Data.
  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }

// 2- Get Data.
  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

// 3- Delete Data.
  static Future<bool> deleteData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

// 4- Clear All Data.
  static Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }
}