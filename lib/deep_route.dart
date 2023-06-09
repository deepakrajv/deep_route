library deep_route;

import 'package:deep_route/deep_material_app.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
final DeepRoute = _DeepRoute();

class _DeepRoute {
  /// **Navigation.push()** shortcut.<br><br>
  ///
  /// Pushes a new `page` to the stack
  void to(Widget page, {Object? arguments}) {
    if (context != null && context!.mounted) {
      Navigator.of(context!)
          .push(MaterialPageRoute(builder: (BuildContext context) => page));
    }
  }

  /// **Navigation.pushReplacement()** shortcut .<br><br>
  ///
  /// Pop the current page and pushes a new `page` to the stack
  void off(Widget page, {Object? arguments}) {
    if (context != null && context!.mounted) {
      Navigator.of(context!).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => page));
    }
  }

  /// **Navigation.pushAndRemoveUntil()** shortcut.<br><br>
  ///
  /// Push the given `page`, and then pop several pages in the stack until
  /// [predicate] returns true
  void offAll(Widget page, [RoutePredicate? route]) {
    if (context != null && context!.mounted) {
      Navigator.of(context!).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => page),
        route ?? (route) => false,
      );
    }
  }

  /// **Navigation.popUntil()** shortcut.<br><br>
  ///
  /// Pop the current page in the stack
  void back([dynamic result]) {
    if (context != null &&
        context!.mounted &&
        Navigator.of(context!).canPop()) {
      Navigator.of(context!).pop(result);
    }
  }

  /// **Navigation.popUntil()** shortcut.<br><br>
  ///
  /// Calls pop several times in the stack until [predicate] returns true
  void until(RoutePredicate predicate, {int? id}) {
    if (context != null &&
        context!.mounted &&
        Navigator.of(context!).canPop()) {
      Navigator.of(context!).popUntil(predicate);
    }
  }

  /// **Navigation.pushNamed()** shortcut.<br><br>
  ///
  /// Pushes a new named `page` to the stack.
  void toNamed(String routeName, {Object? arguments}) {
    if (context != null && context!.mounted) {
      Navigator.of(context!).pushNamed(
        routeName,
        arguments: arguments,
      );
    }
  }

  /// **Navigation.pushReplacementNamed()** shortcut.<br><br>
  ///
  /// Pop the current named `page` in the stack and push a new one in its place
  void offNamed(String routeName, {Object? arguments}) {
    if (context != null && context!.mounted) {
      Navigator.of(context!).pushReplacementNamed(
        routeName,
        arguments: arguments,
      );
    }
  }

  /// **Navigation.pushNamedAndRemoveUntil()** shortcut.<br><br>
  ///
  /// Push the given named `page`, and then pop several pages in the stack
  /// until [predicate] returns true
  void offAllNamed(
    String routeName, {
    RoutePredicate? route,
    Object? arguments,
  }) {
    if (context != null && context!.mounted) {
      Navigator.of(context!).pushNamedAndRemoveUntil(
        routeName,
        route ?? (route) => false,
        arguments: arguments,
      );
    }
  }

  /// **Navigation.popAndPushNamed()** shortcut.<br><br>
  ///
  /// Pop the current named page and pushes a new `page` to the stack
  /// in its place
  void offAndToNamed(
    String routeName, {
    Object? arguments,
  }) {
    if (context != null && context!.mounted) {
      Navigator.of(context!).popAndPushNamed(
        routeName,
        arguments: arguments,
      );
    }
  }

  BuildContext? get context => key.currentContext;

  GlobalKey<NavigatorState> get key => DeepMaterialApp.customKey;
}
