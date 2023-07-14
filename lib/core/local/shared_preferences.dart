import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  SharedPreferences sharedPreferences;
  PreferenceHelper({
    required this.sharedPreferences,
  });
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  dynamic getDataFromSharedPreference({required String key}) {
    return sharedPreferences.get(key);
  }

  dynamic getBoolDataFromSharedPreference({required String key}) {
    return sharedPreferences.getBool(key);
  }

  Future<bool> saveDataInSharedPreference(
      {required String key, required dynamic value}) async {
    // print("Entrar a guardar en local. key: ${key} value: $value");
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  Future<bool> contains({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  Future clearData() {
    return sharedPreferences.clear();
  }
}
