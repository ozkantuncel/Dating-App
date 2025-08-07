import 'package:dating_app/core/thema/app_themes.dart';
import 'package:dating_app/injection_container.dart';
import 'package:dating_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      routerConfig: locator<AppRouter>().router,
    );
  }
}