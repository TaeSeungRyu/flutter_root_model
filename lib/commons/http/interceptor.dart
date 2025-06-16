import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;

/// QueuedInterceptorsWrapper 사용시 renewAccessToken() request 후 401 을 잡아내지 못함
class Interceptor extends InterceptorsWrapper {
  static final Interceptor _instance = Interceptor._init();
  factory Interceptor() => _instance;
  Interceptor._init();
  DateTime currentDateTime401 = DateTime.now();
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if(err is SocketException || err.error is SocketException){
      Get.snackbar('인터넷 연결 상태', '인터넷 연결이 원활하지 않습니다.',
        snackPosition: SnackPosition.TOP,);
    }
    return handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //TODO : Auth 토큰 넣는 로직 추가
    debugPrint('options Authorization : ${options.headers}');
    debugPrint('options : ${options.path}');
    debugPrint('options : ${options.data}');
    debugPrint('options : ${options.queryParameters}');
    debugPrint('options : ${options.method}');
    debugPrint('options : ${options.connectTimeout}');
    debugPrint('options : ${options.receiveTimeout}');
    debugPrint('options : ${options.uri}');
    return handler.next(options);
  }


  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    debugPrint('response : ${response.data}');
    debugPrint('response : ${response.statusCode}');
    if (response.statusCode == 401) {
      DateTime now = DateTime.now();
      if(now.difference(currentDateTime401).inSeconds > 10){
        Get.snackbar(
          '로그인 만료',
          '기간이 만료되어 다시 로그인하여 주세요.',
          snackPosition: SnackPosition.TOP,
        );
        currentDateTime401 = now;
      }
    }
    return handler.next(response);
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  Map<String, dynamic> parseJwtPayLoad(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }
}