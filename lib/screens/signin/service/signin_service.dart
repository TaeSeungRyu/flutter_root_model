
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:root_model/commons/constants.dart';

class SigninService extends GetxService {

  Future<bool> login(String username, String password) async {
    // 입력 검증
    if (username.isEmpty || password.isEmpty) {
      throw Exception('아이디와 비밀번호를 모두 입력해주세요.');
    }
    if (password.length < 6) {
      throw Exception('비밀번호는 최소 6자 이상이어야 합니다.');
    }

    // API 요청
    final response = await http.post(
      Uri.parse('${APIS.apiBaseUrl}/auth/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final success = data['result']['success'] ?? false;
      if (success) {
        // 토큰 저장 등 처리 가능
        return true;
      } else {
        throw Exception(data['message'] ?? '로그인 실패');
      }
    } else {
      throw Exception('서버 오류: ${response.statusCode}');
    }
  }
}
