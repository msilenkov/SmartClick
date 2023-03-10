import 'dart:convert';

class UserModel {
  final String phone;
  final bool? registration;
  final bool? autorized;
  final String? accessToken;
  final String? refreshToken;

  UserModel({
    required this.phone,
    this.registration,
    this.autorized,
    this.accessToken,
    this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      'registration': registration,
      'autorized': autorized,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      phone: map['phone'] as String,
      registration:
          map['registration'] != null ? map['registration'] as bool : null,
      autorized: map['autorized'] != null ? map['autorized'] as bool : null,
      accessToken:
          map['accessToken'] != null ? map['accessToken'] as String : null,
      refreshToken:
          map['refreshToken'] != null ? map['refreshToken'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
