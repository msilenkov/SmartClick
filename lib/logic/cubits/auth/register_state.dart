// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'register_cubit.dart';

class RegisterState {
  String register;
  RegisterState({required this.register});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'register': register,
    };
  }

  factory RegisterState.fromMap(Map<String, dynamic> map) {
    return RegisterState(
      register: map['register'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterState.fromJson(String source) =>
      RegisterState.fromMap(json.decode(source) as Map<String, dynamic>);
}
