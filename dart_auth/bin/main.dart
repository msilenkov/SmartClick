import 'dart:io';

import 'package:conduit/conduit.dart';
import 'package:dart_auth/dart_auth.dart';

void main(List<String> arguments) async {
  final int port = int.parse(Platform.environment['PORT'] ?? '8080');
  final service = Application<AppService>()..options.port = port;
  await service.start(numberOfInstances: 3, consoleLogging: true);
}
