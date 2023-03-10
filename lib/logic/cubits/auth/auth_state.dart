// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'auth_cubit.dart';

class AuthState {
  bool autorized;
  AuthState({required this.autorized});

  @override
  String toString() => 'AuthState(autorized: $autorized)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'autorized': autorized,
    };
  }

  factory AuthState.fromMap(Map<String, dynamic> map) {
    return AuthState(
      autorized: map['autorized'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthState.fromJson(String source) =>
      AuthState.fromMap(json.decode(source) as Map<String, dynamic>);
}
