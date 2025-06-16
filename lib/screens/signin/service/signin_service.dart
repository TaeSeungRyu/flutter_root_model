
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:root_model/commons/auth/auth_controller.dart';
import 'package:root_model/commons/constants.dart';
import 'package:root_model/commons/http/bu_http_client.dart';

class SigninService extends GetxService {

  AuthController authController = Get.find<AuthController>();

  Future<bool> login(String username, String password) async {
    // 입력 검증
    if (username.isEmpty || password.isEmpty) throw Exception('아이디와 비밀번호를 모두 입력해주세요.');
    if (password.length < 6) throw Exception('비밀번호는 최소 6자 이상이어야 합니다.');

    // API 요청
    final response = await BuHttpClient.post(
      '${APIS.apiBaseUrl}/auth/login',
      data:{
        'username': username,
        'password': password,
      }
    );
    if (response['success']) {
      final data = response['data'];
      final accessToken = data['result']['accessToken'];
      if (accessToken != null) {
        authController.putAccessToken(accessToken);
        return true;
      } else {
        throw Exception(data['message'] ?? '로그인 실패');
      }
    } else {
      throw Exception('서버 오류: ${response.statusCode}');
    }
  }
}
