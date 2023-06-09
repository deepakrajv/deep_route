library deep_route;

import 'package:deep_route/deep_material_app.dart';
import 'package:flutter/cupertino.dart';

// ignore: non_constant_identifier_names
final DeepRoute = _DeepRoute();

class _DeepRoute {
  void toNamed(String routeName, {Object? arguments}) {
    if (context != null && context!.mounted) {
      Navigator.of(context!).pushNamed(
        routeName,
        arguments: arguments,
      );
    }
  }

  void offNamed(String routeName, {Object? arguments}) {
    if (context != null && context!.mounted) {
      Navigator.of(context!).pushReplacementNamed(
        routeName,
        arguments: arguments,
      );
    }
  }

  void offAllNamed(String routeName, {Object? arguments}) {
    if (context != null && context!.mounted) {
      Navigator.of(context!).pushNamedAndRemoveUntil(
        routeName,
        (route) => false,
        arguments: arguments,
      );
    }
  }

  BuildContext? get context => key.currentContext;

  GlobalKey<NavigatorState> get key => DeepMaterialApp.customKey;
}
