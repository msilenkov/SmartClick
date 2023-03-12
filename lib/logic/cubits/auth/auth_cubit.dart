import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit() : super(AuthState(autorize: 'notautorized'));

  void autorize() => emit(AuthState(autorize: 'autorized'));
  void notautorize() => emit(AuthState(autorize: 'notautorized'));

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toMap();
  }

  void registration() {}
}
