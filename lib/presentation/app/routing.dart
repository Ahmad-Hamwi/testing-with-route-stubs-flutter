import 'package:flutter/material.dart';
import 'package:testing_with_route_stubs_flutter/di/container.dart';
import 'package:testing_with_route_stubs_flutter/infrastructure/infra_dependencies.dart';
import 'package:testing_with_route_stubs_flutter/presentation/pages/home_page.dart';
import 'package:testing_with_route_stubs_flutter/presentation/pages/login_page.dart';

class Routing {
  static const String loginRoute = "/";
  static const String homeRoute = "/home";

  static Map<String, Widget Function(RouteSettings)> routeToWidgetMappings = {
    loginRoute: (settings) => const LoginPage(),
    homeRoute: (settings) => HomePage(
          textArgument: settings.arguments as String,
          homeDataSource: sl<HomeRemoteDataSource>(),
        ),
  };

  static Widget getWidgetOfRoute(RouteSettings settings) {
    final routeName = settings.name;

    final widgetFunction = routeToWidgetMappings[routeName];

    assert(
      widgetFunction != null,
      "No route to widget mapping found for route \"${settings.name}\", make sure you have register the widget as you're adding a new route.",
    );

    return widgetFunction!(settings);
  }

  static PageRoute onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => getWidgetOfRoute(settings),
      settings: settings,
    );
  }
}
