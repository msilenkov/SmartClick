import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_click/screens/enter_screen.dart';

class SmartClick extends StatelessWidget {
  const SmartClick({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        title: 'Flutter Demo',
        home: EnterScreen());
  }
}
