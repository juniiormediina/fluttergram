library app.auth;

// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttergram/bloc/bloc.dart';
import 'package:fluttergram/helpers/navigator.dart';
import 'package:fluttergram/locator.dart';
import 'package:fluttergram/screens/home/home_view.dart';

import 'package:fluttergram/ui_shared/constanst.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/widgets/button.dart';
import 'package:fluttergram/widgets/input.dart';
import 'package:fluttergram/widgets/social_button.dart';

import 'package:fluttergram/repository/auth_repository.dart';

part 'login_view.dart';
part 'sign_up_view.dart';
part 'recover_password.dart';

class AuthView extends StatelessWidget {
  static String route = '/auth';
  final NavigatorService navigator = locator<NavigatorService>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: LoginView.route,
      key: navigator.authNavigatorKey,
      onGenerateRoute: autheticationRouteStack,
    );
  }
}

Route<dynamic>? autheticationRouteStack(RouteSettings settings) {
  Map<String, Route<dynamic>> appRouting = <String, Route<dynamic>>{
    SignUpView.route: MaterialPageRoute<dynamic>(
      settings: RouteSettings(name: settings.name),
      builder: (_) => SignUpView(),
    ),
    LoginView.route: MaterialPageRoute<dynamic>(
      settings: RouteSettings(name: settings.name),
      builder: (_) => LoginView(),
    ),
    RecoverPasswordView.route: MaterialPageRoute<dynamic>(
      settings: RouteSettings(name: settings.name),
      builder: (_) => RecoverPasswordView(),
    ),
  };
  return appRouting[settings.name];
}
