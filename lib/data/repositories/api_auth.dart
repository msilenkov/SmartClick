import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiAuth {
  Dio apiAuth = Dio();
  String? accessToken;
  final _storage = const FlutterSecureStorage();

  ApiAuth() {
    apiAuth.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      if (!options.path.contains('http')) {
        options.path = 'localhost:5000${options.path}';
      }
      options.headers['Autorization'] = 'Bearer $accessToken';
      return handler.next(options);
    }, onError: (DioError error, handler) async {
      if ((error.response?.statusCode == 401 &&
          error.response?.data['message'] == "Код не верный")) {
        if (await _storage.containsKey(key: 'refreshToken')) {
          await refreshToken();
          return handler.resolve(await _retry(error.requestOptions));
        }
      }
      return handler.next(error);
    }));
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options =
        Options(method: requestOptions.method, headers: requestOptions.headers);
    return apiAuth.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<void> refreshToken() async {
    final refreshToken = await _storage.read(key: 'refreshToken');
    final response = await apiAuth
        .post('auths/refresh', data: {'refreshToken': refreshToken});
    if (response.statusCode == 201) {
      accessToken = response.data;
    } else {
      accessToken = null;
      _storage.deleteAll();
    }
  }
}
