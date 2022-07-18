import 'package:get/get.dart';
import 'package:getx_navigation_bar/pages/account/account_controller.dart';
import 'package:getx_navigation_bar/pages/dashboard/dashboard_controller.dart';
import 'package:getx_navigation_bar/pages/history/history_controller.dart';
import 'package:getx_navigation_bar/pages/home/home_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AccountController>(() => AccountController());
    Get.lazyPut<HistoryController>(() => HistoryController());
  }
}
