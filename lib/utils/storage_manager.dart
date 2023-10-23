import 'package:get_storage/get_storage.dart';

enum StorageKeys { theme, user, biometric, place }

class StorageManager {
  StorageManager(this._box);

  final GetStorage _box;

  static StorageManager? _instance;

  static Future<void> init() async {
    await GetStorage.init();

    if (_instance == null) {
      final GetStorage box = GetStorage();
      _instance = StorageManager(box);
    }
  }

  static Future<void> write(String key, dynamic value) async {
    _instance!._box.write(key, value);
  }

  static T? read<T>(String key, [T? defaultValue]) {
    return (_instance!._box.read(key) as T?) ?? defaultValue;
  }

  static Future<void> clearKey(String key) async {
    _instance!._box.remove(key);
  }

  static Future<void> clearAll() async {
    _instance!._box.erase();
  }
}
