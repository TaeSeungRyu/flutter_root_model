

import 'package:flutter/material.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  static const String routeName = '/test';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('is auth ok this is Test View'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Simulate a test action
            print('Test button pressed');
          },
          child: const Text('Press Me'),
        ),
      ),
    );
  }
}