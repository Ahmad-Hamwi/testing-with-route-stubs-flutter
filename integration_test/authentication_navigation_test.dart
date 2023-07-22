import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:testing_with_route_stubs_flutter/infrastructure/infra_dependencies.dart';
import 'package:testing_with_route_stubs_flutter/presentation/app/routing.dart';
import 'package:testing_with_route_stubs_flutter/presentation/pages/home_page.dart';
import 'package:testing_with_route_stubs_flutter/presentation/pages/login_page.dart';

class FakeHomeRemoteDataSource extends Fake implements HomeRemoteDataSource {
  @override
  Future<String> getData() async {
    return "";
  }
}

class FakeErrorReportingService extends Fake implements ErrorReportingService {
  @override
  Future<void> reportError(e) async {}
}

class FakeAnalyticsService extends Fake implements AnalyticsService {
  @override
  Future<void> logEvent(String name) async {}
}

void registerFakeDependencies() {
  final sl = GetIt.instance;
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => FakeHomeRemoteDataSource(),
  );
  sl.registerLazySingleton<ErrorReportingService>(
    () => FakeErrorReportingService(),
  );
  sl.registerLazySingleton<AnalyticsService>(
    () => FakeAnalyticsService(),
  );
}

void main() {
  registerFakeDependencies();

  testWidgets("Authenticates from login to home page", (tester) async {
    await tester.pumpWidget(const MaterialApp(
      onGenerateRoute: Routing.onGenerateRoute,
      home: LoginPage(),
    ));

    await tester.tap(find.byKey(LoginPage.authButtonKey));

    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
  });
}
