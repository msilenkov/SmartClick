import 'dart:io';

import 'package:jaguar_jwt/jaguar_jwt.dart';

abstract class AppUtils {
  const AppUtils._();

  static int getIdFromToken(String token) {
    try {
      final key = Platform.environment['SECRET'];
      final jwtClaim = verifyJwtHS256Signature(token, key ?? 'SECRET');
      return int.parse(jwtClaim['id'].toString());
    } catch (_) {
      rethrow;
    }
  }
}
