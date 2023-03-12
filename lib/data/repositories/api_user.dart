import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:smartclick/data/models/full_token_model.dart';

class UserApi {
  final Dio dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));

  Future<dynamic> req(String phone) async {
    String signup = '/signup';
    Response response = await dio
        .post("http://192.168.84.2:5000/auths$signup", data: {"phone": phone});
    // print(response.data.toString());
    // print(response.statusCode);
    return response.statusCode;
  }

  Future<FullToken?> reqSignin(String phone, String pass) async {
    String signin = '/signin';
    Response response = await dio.post("http://192.168.84.2:5000/auths$signin",
        data: {"phone": phone, "pass": pass});
    if (response.statusCode == 201) {
      FullToken token = FullToken.fromJson(response.data);
      print("token ..........${FullToken.fromJson(response.data).accessToken}");
      return FullToken.fromJson(response.data);
    } else {
      print("gffffffffffff");
      throw Exception(response.statusCode);
    }
  }
}
