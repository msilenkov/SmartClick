class FullToken {
  final String accessToken, refreshToken;

  FullToken({required this.accessToken, required this.refreshToken});

  factory FullToken.fromJson(Map<String, dynamic> json) {
    return FullToken(
      accessToken:
          json["accessToken"], // те ключи что пришли в ответе на запрос
      refreshToken: json["refreshToken"],
    );
  }
}
