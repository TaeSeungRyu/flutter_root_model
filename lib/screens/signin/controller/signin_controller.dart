
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:root_model/screens/issign/test.dart';
import 'package:root_model/screens/signin/service/signin_service.dart';

class SigninController extends GetxController with WidgetsBindingObserver {
  static SigninController get to => Get.find();

  RxString sampleText = 'asdf1234'.obs;

  late TextEditingController usernameController;
  late TextEditingController passwordController;
  final SigninService _service = Get.find();

  @override
  void onInit() {
    usernameController = TextEditingController(text: 'admin');
    passwordController = TextEditingController(text: 'admin1234');
  }

  Future<void> attemptLogin() async {
    try {
      final result = await _service.login(
        usernameController.text.trim(),
        passwordController.text.trim(),
      );
      if (result) {
        Get.snackbar('성공', '로그인에 성공했습니다!');
      }
    } catch (e) {
      Get.snackbar('오류', e.toString().replaceAll('Exception: ', ''));
    }
  }

  void testMovePage () {
    Get.toNamed(TestView.routeName);
  }

}