import 'package:get/get.dart';

class AccountController extends GetxController {
  RxInt counter = 0.obs;

  void increaseCounter() {
    counter.value += 1;
  }
}
