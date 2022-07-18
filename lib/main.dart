import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_navigation_bar/routes/app_pages.dart';
import 'package:getx_navigation_bar/routes/app_routes.dart';
import 'package:getx_navigation_bar/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.LOGIN,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
    );
  }
}
