import 'package:flutter/material.dart';
import 'package:testing_with_route_stubs_flutter/presentation/app/routing.dart';

/// A map from a route name to a flag indicating if the route should stubbed
/// or not.
typedef RouteStubbingOptions = Map<String, bool>;

class TestRouting {
  static PageRoute onGenerateRoute({
    required RouteSettings settings,
    required RouteStubbingOptions routeStubbingOptions,
  }) {
    final routeName = settings.name;

    return MaterialPageRoute(
      builder: (_) {
        final routeStubbingFlag = routeStubbingOptions[routeName] ?? false;

        Key key = Key(settings.name!);

        return routeStubbingFlag
            ? Placeholder(key: key)
            : Routing.getWidgetOfRoute(settings);
      },
      settings: settings,
    );
  }
}
