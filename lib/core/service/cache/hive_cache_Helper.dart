import 'package:hive_flutter/hive_flutter.dart';

class HiveCacheHelper {
  static late Box box;

  //! initialize hive
  static Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox('appBox');
  }

  //! save data
  static Future<void> saveData({
    required String key,
    required dynamic value,
  }) async {
    await box.put(key, value);
  }

  //! get data
  static dynamic getData({required String key}) {
    return box.get(key);
  }

  //! get string
  static String? getString({required String key}) {
    return box.get(key);
  }

  //! remove data
  static Future<void> removeData({required String key}) async {
    await box.delete(key);
  }

  //! check if key exists
  static bool containsKey({required String key}) {
    return box.containsKey(key);
  }

  //! get all keys
  static List getAllKeys() {
    return box.keys.toList();
  }

  //! clear all data
  static Future<void> clearData() async {
    await box.clear();
  }
}
