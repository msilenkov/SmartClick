import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartclick/logic/cubits/auth/auth_cubit.dart';
import 'package:smartclick/presentatios/router/app_router.dart';

class SmartClick extends StatelessWidget {
  SmartClick({super.key});
  final AppRouter _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: "SF Pro Rounded",
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder()
            })),
        title: 'Flutter Demo',
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
    // home: const EnterScreen());
  }
}
