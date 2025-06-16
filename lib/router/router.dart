import 'package:get/get.dart';
import 'package:root_model/commons/auth/auth_controller.dart';
import 'package:root_model/screens/signin/controller/signin_controller.dart';
import 'package:root_model/screens/signin/service/signin_service.dart';
import 'package:root_model/screens/signin/signin.dart';
import 'package:root_model/screens/splash/controller/splash_controller.dart';
import 'package:root_model/screens/splash/splash.dart';

const Transition transition = Transition.fade; // Transition.fadeIn;
const transitionDuration = Duration(milliseconds: 300);

List<GetPage> route() {
  return [
    GetPage(
      name: Splash.routeName,
      transition: transition,
      transitionDuration: transitionDuration,
      page: () => const Splash(),
    ),
    GetPage(
      name: Signin.routeName,
      transition: transition,
      transitionDuration: transitionDuration,
      page: () => const Signin(),

    ),
  ];
}
