// ignore_for_file: import_of_legacy_library_into_null_safe, deprecated_member_use

library bloc.auth;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttergram/helpers/navigator.dart';
import 'package:fluttergram/locator.dart';
import 'package:fluttergram/repository/auth_repository.dart';
import 'package:fluttergram/screens/home/home_view.dart';

part './auth_state.dart';
part './auth_events.dart';

class AuthBLoC extends Bloc<AuthEvent, AuthState> {
  AuthBLoC() : super(AuthState());

  final AuthRepository repository = locator<AuthRepository>();
  final NavigatorService navigator = locator<NavigatorService>();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is Login) {
      yield* _mapLoginToState(email: event.email, password: event.password);
    } else if (event is SignUp) {
      yield* _mapSignUpToState(email: event.email, password: event.password);
    }
  }

  Stream<AuthState> _mapLoginToState(
      {required String email, required String password}) async* {
    try {
      User? user =
          await repository.login(email: email.trim(), password: password);
      yield AuthState(user: user);
      navigator.replace(route: HomeView.route);
    } catch (e) {
      yield AuthState(error: e.toString());
    }
  }

  Stream<AuthState> _mapSignUpToState(
      {required String email, required String password}) async* {
    try {
      User? user = await repository.register(email: email, password: password);
      yield AuthState(user: user);
      navigator.replace(route: HomeView.route);
    } catch (e) {
      yield AuthState(error: e.toString());
    }
  }
}
