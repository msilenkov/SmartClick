// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthState {
  String autorize;
  AuthState({required this.autorize});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'autorize': autorize,
    };
  }

  factory AuthState.fromMap(Map<String, dynamic> map) {
    return AuthState(
      autorize: map['autorize'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthState.fromJson(String source) =>
      AuthState.fromMap(json.decode(source) as Map<String, dynamic>);
}
