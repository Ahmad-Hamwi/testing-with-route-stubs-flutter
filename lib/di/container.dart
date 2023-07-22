import 'package:get_it/get_it.dart';
import 'package:testing_with_route_stubs_flutter/infrastructure/infra_dependencies.dart';

final sl = GetIt.instance;

class DI {
  static void initialize() {
    sl.registerLazySingleton(() => HomeRemoteDataSource());

    sl.registerLazySingleton(() => ErrorReportingService());

    sl.registerLazySingleton(() => AnalyticsService());
  }
}
