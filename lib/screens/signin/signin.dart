import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:root_model/screens/signin/controller/signin_controller.dart';

class Signin extends GetView<SigninController> {
  const Signin({super.key});

  static const routeName = "/signin";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvoked: (arg) {},
        child: Obx(
          () => Scaffold(
            backgroundColor: Colors.blueAccent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(),
                Text(controller.sampleText.value),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                    controller: controller.usernameController,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                    controller: controller.passwordController,
                  ),
                ),
                ElevatedButton(
                  onPressed: controller.attemptLogin,
                  child: const Text('로그인'),
                ),
                ElevatedButton(
                  onPressed: controller.testMovePage,
                  child: const Text('로그인해야만갈수있는페이지이동'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
