import 'package:fluttergram/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'helpers/navigator.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator
    ..registerLazySingleton(() => NavigatorService())
    ..registerLazySingleton(() => AuthRepository());
}
