import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString title = 'This is Home title fsdfsdf'.obs;

  void updateTitle(String newTitle) {
    title.value = newTitle;
    update();
  }
}
