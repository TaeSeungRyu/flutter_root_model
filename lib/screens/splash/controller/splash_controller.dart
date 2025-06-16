
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:root_model/commons/auth/auth_controller.dart';
import 'package:root_model/screens/signin/signin.dart';

class SplashController extends GetxController {

  static SplashController get to => Get.find();
  final AuthController _controller = Get.find();

  Future<void> navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('accessToken : ${_controller?.accessToken?.value}');
    Get.to(() => const Signin());
  }
}