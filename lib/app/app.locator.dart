import 'package:get_it/get_it.dart';
import 'package:jora_test/repository/auth_repo/auth_repo.dart';
import 'package:jora_test/repository/auth_repo/auth_repo_impl.dart';
import 'package:jora_test/service/network_service/network_service.dart';
import 'package:jora_test/service/network_service/network_service_impl.dart';

final locator = GetIt.I;

void setupLocator() {
  /// Register network service
  locator.registerLazySingleton<NetworkService>(() => NetworkServiceImpl());
  locator.registerLazySingleton<AuthenticationRepo>(() => AuthenticationRepoImpl());

}
