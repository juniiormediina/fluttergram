import 'package:flutter/material.dart';
import 'package:fluttergram/screens/auth/auth_view.dart';
import 'package:fluttergram/screens/home/home_view.dart';
import 'package:fluttergram/screens/walkthrough/walkthrough_view.dart';

class UIRouter {
  static String initialRoute = WalkthroughView.route;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, Route<dynamic>> appRouting = <String, Route<dynamic>>{
      AuthView.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: settings.name),
        builder: (_) => AuthView(),
      ),
      WalkthroughView.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: settings.name),
        builder: (_) => WalkthroughView(),
      ),
      HomeView.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: settings.name),
        builder: (_) => HomeView(),
      )
    };

    return appRouting[settings.name] ??
        MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Route not found ${settings.name}'),
            ),
          ),
        );
  }
}
