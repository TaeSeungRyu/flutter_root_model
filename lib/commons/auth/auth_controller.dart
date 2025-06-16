
import 'package:get/get.dart';
import 'package:root_model/commons/Storage/storage.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  static const authKey = "auth";
  RxString accessToken = ''.obs;

  @override
  void onInit() {
    Storage.get(authKey).then((data){
      accessToken.value = data ?? '';
    });
    Storage.addListener(authKey, (data){
      accessToken.value = data ?? '';
    });
  }

  putAccessToken(String accessToken) {
    Storage.put(key: authKey, value: accessToken);
  }

}