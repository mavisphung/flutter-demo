import 'package:get/get.dart';
import 'package:getx_navigation_bar/pages/dashboard/dashboard_binding.dart';
import 'package:getx_navigation_bar/pages/dashboard/dashboard_page.dart';
import 'package:getx_navigation_bar/pages/login/login_binding.dart';
import 'package:getx_navigation_bar/pages/login/login_page.dart';
import 'package:getx_navigation_bar/pages/register/register_page.dart';
import 'package:getx_navigation_bar/routes/app_routes.dart';

class AppPages {
  static List<GetPage> list = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      fullscreenDialog: true,
      page: () => const RegisterPage(),
      // binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
  ];
}
