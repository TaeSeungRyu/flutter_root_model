import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CookieSecureStorage implements Storage {
  late FlutterSecureStorage _storage;

  @override
  Future<void> init(bool persistSession, bool ignoreExpires) async {
    _storage = const FlutterSecureStorage();
  }

  @override
  Future<void> delete(String key) {
    return _storage.delete(key: key);
  }

  @override
  Future<void> deleteAll([List<String>? keys]) {
    if (keys != null && keys.isNotEmpty) {
      return Future.forEach<String>(keys, (key) => _storage.delete(key: key));
    }
    return _storage.deleteAll();
  }

  @override
  Future<String?> read(String key) {
    return _storage.read(key: key);
  }

  @override
  Future<void> write(String key, String value) {
    return _storage.write(key: key, value: value);
  }
}