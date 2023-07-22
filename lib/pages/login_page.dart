import 'package:flutter/material.dart';
import 'package:testing_with_route_stubs_flutter/app/routing.dart';

class LoginPage extends StatelessWidget {
  static const Key authButtonKey = Key("authenticate-button");

  const LoginPage({Key? key}) : super(key: key);

  void _navigateToHome(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routing.homeRoute,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Tap the button to mimic authentication'),
            const SizedBox(height: 48),
            ElevatedButton(
              key: authButtonKey,
              onPressed: () => _navigateToHome(context),
              child: const Text("Authenticate"),
            )
          ],
        ),
      ),
    );
  }
}
