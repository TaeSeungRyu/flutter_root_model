import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:root_model/router/router.dart';
import 'package:root_model/screens/signin/controller/signin_controller.dart';
import 'package:root_model/screens/signin/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String firstPage = Signin.routeName;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      locale: const Locale('ko'),
      fallbackLocale: const Locale('ko', 'KR'),
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('ko', ''), // Korean, no country code
      ],
      getPages: route(),
      initialRoute: firstPage,
      initialBinding: _InitBinding(),
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return ScrollConfiguration(
          behavior: MyBehavior(), //글로우 효과 제거
          child: MediaQuery(
            data: data.copyWith(textScaler: const TextScaler.linear(1)), //과도한 텍스트 스케일 방지
            child: child!,
          ),
        );
      },
    );
  }
}

/// 컨트롤러 상태 바인딩 클래스 입니다.
class _InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => SigninController(), permanent: true);
  }
}


class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}