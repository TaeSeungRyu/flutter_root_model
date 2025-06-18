

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:root_model/commons/auth/auth_controller.dart';
import 'package:root_model/screens/signin/signin.dart';

class AuthGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final accessToken = Get.find<AuthController>().accessToken.value;
    if (accessToken.isEmpty) {
      return const RouteSettings(name: Signin.routeName);
    }
    return null;
  }
}