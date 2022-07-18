import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_navigation_bar/pages/login/models.dart';
import 'package:getx_navigation_bar/routes/app_routes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum LoginStatus { init, loading, error }

class LoginController extends GetxController {
  RxString username = ''.obs;
  RxString password = ''.obs;
  final String _type = 'MEMBER';
  Rx<LoginStatus> loginStatus = LoginStatus.init.obs;
  var client = http.Client();
  String baseUrl = 'capstone-elb-1141242582.ap-southeast-1.elb.amazonaws.com';

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String get type => _type;

  Future login() async {
    print('Before call api: ${loginStatus.value}');
    if (loginStatus.value == LoginStatus.loading) {
      return;
    }
    loginStatus.value = LoginStatus.loading;

    // Request Login model
    RequestLoginModel model = RequestLoginModel(
      email: usernameController.value.text,
      password: passwordController.value.text,
    );

    await Future.delayed(const Duration(seconds: 5));
    var response = await client.post(
      Uri.http(baseUrl, '/login/'),
      body: model.toMap(),
    );

    var decodedResponse = ResponseLoginModel.fromJson(response.body);
    if (response.statusCode >= 400) {
      Get.snackbar(
        'Login Error',
        decodedResponse.message,
        margin: const EdgeInsets.all(12.0),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
      loginStatus.value = LoginStatus.error;
      update();
      return;
    }

    update();
    Get.offNamed(AppRoutes.DASHBOARD);
  }
}
