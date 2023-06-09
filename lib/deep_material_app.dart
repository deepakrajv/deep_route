import 'package:flutter/material.dart';

class DeepMaterialApp extends StatelessWidget {
  const DeepMaterialApp({
    Key? key,
    this.title = '',
    this.theme,
    this.initialRoute,
    this.onGenerateRoute,
  }) : super(key: key);

  static final customKey =
  GlobalKey<NavigatorState>(debugLabel: 'Default Key Created');

  final String title;

  final ThemeData? theme;

  final String? initialRoute;

  final RouteFactory? onGenerateRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: DeepMaterialApp.customKey,
      title: title,
      theme: theme,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
