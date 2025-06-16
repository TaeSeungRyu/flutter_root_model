

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:root_model/screens/splash/controller/splash_controller.dart';

class Splash extends GetView<SplashController> {
  const Splash({super.key});

  static const String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.navigateToNextScreen();
    });
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Welcome to MyApp',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}