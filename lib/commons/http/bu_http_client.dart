import 'package:cookie_jar/cookie_jar.dart' hide Storage;
import 'package:dio/dio.dart' hide Interceptor, LogInterceptor;
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:get/get.dart' hide Response;
import 'package:root_model/commons/constants.dart';
import 'package:root_model/commons/http/cookie_secure_storage.dart';


import 'interceptor.dart';


class BuHttpClient {
  static final BuHttpClient _instance = BuHttpClient._init();

  factory BuHttpClient() => _instance;

  static BuHttpClient get to => Get.find();

  final Dio dio = Dio(BaseOptions(
    baseUrl: APIS.apiBaseUrl,
    headers: {'Content-Type': 'application/json;charset=UTF-8'},
    connectTimeout: const Duration(milliseconds: 5000),
  ));


  static final persistCookieJar = PersistCookieJar(storage: CookieSecureStorage());

  BuHttpClient._init() {
    dio.interceptors.clear();
    dio.interceptors.add(Interceptor());
    dio.interceptors.add(CookieManager(persistCookieJar));
  }

  static removeCookie() {
    persistCookieJar.deleteAll();
  }

  static Future<dynamic> post(
      String apis, {
        data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? pathParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    var result = await _instance.dio.post(
      apis,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options: Options(validateStatus: (_) => true),
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return {
      'success': result.statusCode == 200 || result.statusCode == 201,
      'data': result.data,
      'statusCode': result.statusCode,
      'message': result.statusMessage,
    };
  }

  static Future<dynamic> get(
      String apis, {
        Map<String, dynamic>? data,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    Response result = await _instance.dio.get(
      apis,
      queryParameters: data,
      options: Options(validateStatus: (_) => true),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return {
      'success': result.statusCode == 200 || result.statusCode == 201,
      'data': result.data,
      'statusCode': result.statusCode,
      'message': result.statusMessage,
    };
  }

  static Future<dynamic> put(
      String apis, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    Response result = await _instance.dio.put(
      apis,
      data: data,
      queryParameters: queryParameters,
      options: Options(validateStatus: (_) => true),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return {
      'success': result.statusCode == 200 || result.statusCode == 201,
      'data': result.data,
      'statusCode': result.statusCode,
      'message': result.statusMessage,
    };
  }

  static Future<dynamic> delete(
      String apis, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    var result = await _instance.dio.delete(
      apis,
      queryParameters: queryParameters,
      data: data,
      options: Options(validateStatus: (_) => true),
      cancelToken: cancelToken,
    );
    return {
      'success': result.statusCode == 200 || result.statusCode == 201,
      'data': result.data,
      'statusCode': result.statusCode,
      'message': result.statusMessage,
    };
  }

  static Future<Response> recall(
      String path, {
        required Options options,
        dynamic data,
        dynamic queryParameters,
      }) async {
    return await _instance.dio.request(path, options: options, data: data, queryParameters: queryParameters);
  }
}