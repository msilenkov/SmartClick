import 'dart:io';

import 'package:conduit/conduit.dart';
import 'package:dart_auth/models/response_model.dart';
import 'package:dart_auth/utils/app_response.dart';
import 'package:dart_auth/utils/app_utils.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

import 'package:dart_auth/models/user.dart';

class AppAuthController extends ResourceController {
  final ManagedContext managedContext;

  AppAuthController(this.managedContext);

  @Operation.post()
  Future<Response> signIn(@Bind.body() User user) async {
    if (user.phoneNumber == null) {
      return Response.badRequest(
          body: ResponseModel(message: 'Номер телефона не найден'));
    }

    try {
      final qFindUser = Query<User>(managedContext)
        ..where((table) => table.phoneNumber).equalTo(user.phoneNumber)
        ..returningProperties(
            (table) => [table.id, table.salt, table.hashPhone]);
      final findUser = await qFindUser.fetchOne();
      if (findUser == null) {
        throw QueryException.input('Номер телефона не найден', []);
      }
      final requestHashPhone =
          generatePasswordHash(user.phoneNumber ?? '', findUser.salt ?? '');
      if (requestHashPhone == findUser.hashPhone) {
        await _updateTokens(findUser.id ?? -1, managedContext);
        final newUser =
            await managedContext.fetchObjectWithID<User>(findUser.id);
        return AppResponse.ok(
            body: newUser?.backing.contents, message: 'Успешная авторизация');
      } else {
        throw QueryException.input('Номер телефона не найден', []);
      }
    } catch (error) {
      return AppResponse.serverError(error, message: 'Ошибка авторизации');
    }
  }

  @Operation.put()
  Future<Response> signUp(@Bind.body() User user) async {
    if (user.phoneNumber == null) {
      return Response.badRequest(
          body: ResponseModel(message: 'Номер телефона обязателен'));
    }

    final salt = generateRandomSalt();
    final hashPhone = generatePasswordHash(user.phoneNumber ?? "", salt);

    try {
      late final int id;
      await managedContext.transaction((transaction) async {
        final qCreateUser = Query<User>(transaction)
          ..values.phoneNumber = user.phoneNumber
          ..values.salt = salt
          ..values.hashPhone = hashPhone;
        final createdUser = await qCreateUser.insert();
        id = createdUser.asMap()['id'];
        await _updateTokens(id, transaction);
      });
      final userData = await managedContext.fetchObjectWithID<User>(id);
      return AppResponse.ok(
          body: userData?.backing.contents, message: 'Успешная регистрация');
    } catch (error) {
      return AppResponse.serverError(error, message: 'Ошибка регистрации');
    }
  }

  Future<void> _updateTokens(int id, ManagedContext transaction) async {
    final Map<String, dynamic> tokens = _getTokens(id);
    final qUpdateTokens = Query<User>(transaction)
      ..where((user) => user.id).equalTo(id)
      ..values.accessToken = tokens['access']
      ..values.refreshToken = tokens['refresh'];
    await qUpdateTokens.updateOne();
  }

  @Operation.post('refresh')
  Future<Response> refreshToken(
      @Bind.path('refresh') String refreshToken) async {
    try {
      final id = AppUtils.getIdFromToken(refreshToken);
      final user = await managedContext.fetchObjectWithID<User>(id);
      if (user?.refreshToken != refreshToken) {
        return Response.unauthorized(
            body: ResponseModel(message: 'Невалидный токен'));
      } else {
        await _updateTokens(id, managedContext);
        final user = await managedContext.fetchObjectWithID<User>(id);
        return AppResponse.ok(
            body: user?.backing.contents,
            message: 'Успешное обновление токенов');
      }
    } catch (error) {
      return AppResponse.serverError(error,
          message: 'Ошибка обновления токенов');
    }
  }

  Map<String, dynamic> _getTokens(int id) {
    //удалить перерд релизом
    final key = Platform.environment['SECRET'] ?? 'SECRET';
    final accessClaimSet =
        JwtClaim(maxAge: Duration(hours: 1), otherClaims: {'id': id});
    final refreshClaimSet = JwtClaim(otherClaims: {'id': id});
    final tokens = <String, dynamic>{};
    tokens['access'] = issueJwtHS256(accessClaimSet, key);
    tokens['refresh'] = issueJwtHS256(refreshClaimSet, key);
    return tokens;
  }
}
