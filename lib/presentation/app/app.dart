import 'package:flutter/material.dart';
import 'package:testing_with_route_stubs_flutter/presentation/app/routing.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routing.loginRoute,
      onGenerateRoute: Routing.onGenerateRoute,
    );
  }
}