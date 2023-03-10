// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print(change);
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print("$bloc, $error, $stackTrace");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onCreate(BlocBase bloc) {
    print(bloc);
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    print("$bloc");
    super.onClose(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print('$bloc, $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('$bloc, $transition');
    super.onTransition(bloc, transition);
  }
}
