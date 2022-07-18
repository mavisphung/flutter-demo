import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

enum LoginStatus { init, loading, error }

class LoginController extends GetxController {
  RxString username = ''.obs;
  RxString password = ''.obs;
  final String _type = 'MEMBER';
  Rx<LoginStatus> loginStatus = LoginStatus.init.obs;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String get type => _type;

  void updateUI(LoginStatus status) {
    loginStatus.value = status;
    update();
  }
}
