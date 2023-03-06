import 'package:flutter/material.dart';
import 'package:smartclick/presentatios/screens/enter_screen.dart';

class SmartClick extends StatelessWidget {
  const SmartClick({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: "SF Pro Rounded",
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder()
            })),
        title: 'Flutter Demo',
        home: const EnterScreen());
  }
}
