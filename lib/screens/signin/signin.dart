

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
        onPopInvoked: (arg) {

        },
        child: const SafeArea(
          child: Scaffold(
            backgroundColor: Colors.blueAccent,
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(),
                Text("sample text"),
              ],
            ),
          ),
        ),
      ),
    );
  }

}