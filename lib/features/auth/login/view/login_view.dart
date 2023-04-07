import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: centerMethod(),
    );
  }

  Center centerMethod() {
    return Center(
      child: Text("Login"),
    );
  }
}