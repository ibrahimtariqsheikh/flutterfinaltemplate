import 'package:flutter/material.dart';

class CrudTest extends StatelessWidget {
  static const String routeName = '/crudtest';
  const CrudTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Crud Test'),
      ),
    );
  }
}
