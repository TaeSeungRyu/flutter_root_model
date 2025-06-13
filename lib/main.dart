import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:root_model/router/router.dart';
import 'package:root_model/screens/signin/signin.dart';

void main() async {
  await dotenv.load(); //비동기로 로드
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
      fallbackLocale: const Locale('kr', 'KR'),
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('kr', ''), // Korean, no country code
      ],
      getPages: route(),
      initialRoute: firstPage,
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return ScrollConfiguration(
          behavior: MyBehavior(), //글로우 효과 제거
          child: MediaQuery(
            data: data.copyWith(textScaler: const TextScaler.linear(1)),
            //과도한 텍스트 스케일 방지
            child: child!,
          ),
        );
      },
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
