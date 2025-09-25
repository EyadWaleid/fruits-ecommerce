import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _sharedPreferences;

  // Private constructor to prevent instantiation from outside


  // Initialization method to be called once at app startup
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // Generic method to save data
  static Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is String) {
      return await _sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return await _sharedPreferences.setInt(key, value);
    }
    if (value is bool) {
      return await _sharedPreferences.setBool(key, value);
    }
    if (value is double) {
      return await _sharedPreferences.setDouble(key, value);
    }
    if (value is List<String>) {
      return await _sharedPreferences.setStringList(key, value);
    }
    // Add more types if needed
    print("Unsupported data type for key: $key");
    return false;
  }

  // Generic method to get data
  dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }

  // Method to get a String
  static String? getString({required String key}) {

    return _sharedPreferences.getString(key);
  }

  // Method to get an int
  int? getInt({required String key}) {
    return _sharedPreferences.getInt(key);
  }

  // Method to get a bool
  static bool getBool({required String key}) {
    return _sharedPreferences.getBool(key)??false;
  }

  // Method to get a double
  double? getDouble({required String key}) {
    return _sharedPreferences.getDouble(key);
  }

  // Method to get a String list
  List<String>? getStringList({required String key}) {
    return _sharedPreferences.getStringList(key);
  }

  // Method to remove data
  Future<bool> removeData({required String key}) async {
    return await _sharedPreferences.remove(key);
  }

  // Method to clear all data
  Future<bool> clearAllData() async {
    return await _sharedPreferences.clear();
  }

  // Method to check if a key exists
  bool containsKey({required String key}) {
    return _sharedPreferences.containsKey(key);
  }
}
