import 'package:flutter/material.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> authNavigatorKey =
      new GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> homeNavigatorKey =
      new GlobalKey<NavigatorState>();

  void push(
      {required String route, GlobalKey<NavigatorState>? key, dynamic params}) {
    if (key == null) key = navigatorKey;
    key.currentState?.pushNamed(route, arguments: params);
  }

  void replace(
      {required String route, GlobalKey<NavigatorState>? key, dynamic params}) {
    if (key == null) key = navigatorKey;
    key.currentState?.pushReplacementNamed(route, arguments: params);
  }

  void goBack({required String route, GlobalKey<NavigatorState>? key}) {
    if (key == null) key = navigatorKey;
    key.currentState?.pop();
  }
}
