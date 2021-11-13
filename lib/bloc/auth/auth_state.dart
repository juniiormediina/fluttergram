part of 'auth_bloc.dart';

class AuthState {
  final User? user;
  final String? error;
  final bool isLoggedIn;

  AuthState({this.user, this.error, this.isLoggedIn = false});
}
