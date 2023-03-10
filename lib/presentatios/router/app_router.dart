import 'package:flutter/material.dart';
import 'package:smartclick/presentatios/screens/enter_screen.dart';
import 'package:smartclick/presentatios/screens/registration_screen.dart';
import 'package:smartclick/presentatios/screens/second_reg_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const EnterScreen());
      case '/registration':
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      case '/secondregscreen':
        return MaterialPageRoute(builder: (_) => const SecondRegScreen());
      default:
        return null;
    }
  }
}
