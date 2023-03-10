import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:smartclick/smart_click.dart';
import 'package:path_provider/path_provider.dart';
import 'logic/utility/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  Bloc.observer = AppBlocObserver();
  runApp(SmartClick());
}
