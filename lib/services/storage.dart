import 'package:hive/hive.dart';

class StorageService {
  static Future<dynamic> get({
    required String boxName,
    required String key,
  }) async {
    final box = await Hive.openBox(boxName);
    return box.toMap()[key];
  }

  static Future<void> put({
    required String boxName,
    required String key,
    required value,
  }) async {
    final box = await Hive.openBox(boxName);
    box.put(key, value);
  }
}
