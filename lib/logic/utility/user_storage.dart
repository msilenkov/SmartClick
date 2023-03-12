import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserStorage {
  static const _storage = FlutterSecureStorage();
  static const _keyUserPhone = 'phone';
  static const _accessToken = 'access';
  static const _refreshToken = 'refresh';

  static Future setUserPhone(String phone) async =>
      await _storage.write(key: _keyUserPhone, value: phone);

  static Future<String?> getUserPhone() async =>
      await _storage.read(key: _keyUserPhone);

  static Future setAccessToken(String token) async =>
      await _storage.write(key: _accessToken, value: token);

  static Future<String?> getAccessToken() async =>
      await _storage.read(key: _accessToken);

  static Future setRefreshToken(String token) async =>
      await _storage.write(key: _refreshToken, value: token);

  static Future<String?> getRefreshToken() async =>
      await _storage.read(key: _refreshToken);
}
