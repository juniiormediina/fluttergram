import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import './error_codes.dart';

class AuthRepository {
  FirebaseAuth? firebaseAuth;

  AuthRepository() {
    this.firebaseAuth = FirebaseAuth.instance;
  }

  Future<User?> register(
      {required String email, required String password}) async {
    String? error;
    try {
      UserCredential? userRegister = await firebaseAuth
          ?.createUserWithEmailAndPassword(email: email, password: password);
      return userRegister?.user;
    } on FirebaseException catch (e) {
      debugPrint('error from register ${e.toString()}');
      switch (e.code) {
        case ErrorCodes.ERROR_C0DE_NETWORK_ERROR:
          error = ErrorMessages.ERROR_C0DE_NETWORK_ERROR;
          break;
        case ErrorCodes.ERROR_TOO_MANY_REQUESTS:
          error = ErrorMessages.ERROR_TOO_MANY_REQUESTS;
          break;
        case ErrorCodes.ERROR_CODE_EMAIL_ALREADY_IN_USE:
          error = ErrorMessages.ERROR_CODE_EMAIL_ALREADY_IN_USE;
          break;
        case ErrorCodes.ERROR_CODE_EMAIL_ALREADY_IN_USE:
          error = ErrorMessages.ERROR_CODE_EMAIL_ALREADY_IN_USE;
          break;
        case ErrorCodes.ERROR_OPERATION_NOT_ALLOWED:
          error = ErrorMessages.ERROR_OPERATION_NOT_ALLOWED;
          break;
        default:
          error = ErrorMessages.DEFAULT;
      }
      throw Exception(error);
    }
  }

  Future<User?> login({required String email, required String password}) async {
    String? error;
    try {
      UserCredential? loginUser = await firebaseAuth
          ?.signInWithEmailAndPassword(email: email, password: password);
      return loginUser?.user;
    } on FirebaseException catch (e) {
      debugPrint('error from register ${e.toString()}');
      switch (e.code) {
        case ErrorCodes.ERROR_C0DE_NETWORK_ERROR:
          error = ErrorMessages.ERROR_C0DE_NETWORK_ERROR;
          break;
        case ErrorCodes.ERROR_TOO_MANY_REQUESTS:
          error = ErrorMessages.ERROR_TOO_MANY_REQUESTS;
          break;
        case ErrorCodes.ERROR_USER_NOT_FOUND:
          error = ErrorMessages.ERROR_USER_NOT_FOUND;
          break;
        case ErrorCodes.ERROR_CODE_WRONG_PASSWORD:
          error = ErrorMessages.ERROR_CODE_WRONG_PASSWORD;
          break;
        case ErrorCodes.ERROR_INVALID_EMAIL:
          error = ErrorMessages.ERROR_INVALID_EMAIL;
          break;
        case ErrorCodes.ERROR_CODE_USER_DISABLED:
          error = ErrorMessages.ERROR_CODE_USER_DISABLED;
          break;
        case ErrorCodes.ERROR_CODE_USER_DISABLED:
          error = ErrorMessages.ERROR_CODE_USER_DISABLED;
          break;
        case ErrorCodes.ERROR_OPERATION_NOT_ALLOWED:
          error = ErrorMessages.ERROR_OPERATION_NOT_ALLOWED;
          break;
        default:
          error = ErrorMessages.DEFAULT;
      }
      throw Exception(error);
    }
  }

  Future<void> loggout() async {
    await firebaseAuth?.signOut();
  }

  User? getCurrentUser() {
    return firebaseAuth?.currentUser;
  }

  bool isLoggedIn() {
    return getCurrentUser() != null;
  }

  Future<void> restorePassword({required String email}) async {
    try {
      await firebaseAuth?.sendPasswordResetEmail(email: email);
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }
}
