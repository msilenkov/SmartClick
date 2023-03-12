// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String phone;
  final String? autorize;
  final String? accessToken;
  final String? refreshToken;

  UserModel({
    required this.phone,
    this.autorize,
    this.accessToken,
    this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      'autorize': autorize,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      phone: map['phone'] as String,
      autorize: map['autorize'] != null ? map['autorize'] as String : null,
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
