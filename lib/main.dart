import 'package:flutter/widgets.dart';
import 'package:testing_with_route_stubs_flutter/di/container.dart';
import 'package:testing_with_route_stubs_flutter/presentation/app/app.dart';

void main() {
  DI.initialize();

  runApp(const MyApp());
}
