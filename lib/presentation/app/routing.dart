import 'package:flutter/material.dart';
import 'package:testing_with_route_stubs_flutter/di/container.dart';
import 'package:testing_with_route_stubs_flutter/infrastructure/infra_dependencies.dart';
import 'package:testing_with_route_stubs_flutter/presentation/pages/home_page.dart';
import 'package:testing_with_route_stubs_flutter/presentation/pages/login_page.dart';

class Routing {
  static const String loginRoute = "/";
  static const String homeRoute = "/home";

  static PageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routing.homeRoute:
        return MaterialPageRoute(
          builder: (context) => HomePage(
            homeDataSource: sl<HomeRemoteDataSource>(),
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
          settings: settings,
        );
    }
  }
}
