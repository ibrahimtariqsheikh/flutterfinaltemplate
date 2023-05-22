import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  static const String routeName = '/signin';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Sign in Page')),
    );
  }
}
