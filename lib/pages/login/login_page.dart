import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_navigation_bar/pages/login/login_controller.dart';
import 'package:getx_navigation_bar/routes/app_routes.dart';
import 'package:getx_navigation_bar/widgets/item_button_widget.dart';
import 'package:http/http.dart' as http;

// class LoginPage extends StatelessWidget {
class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);
  // LoginController loginController = Get.put(LoginController());
  var client = http.Client();
  String baseUrl = 'capstone-elb-1141242582.ap-southeast-1.elb.amazonaws.com';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        // backgroundColor: const Color(0xFF154C79),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 55,
                              child: TextField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(7.5)),
                                  ),
                                  filled: true,
                                  floatingLabelAlignment: FloatingLabelAlignment.start,
                                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                                  labelText: 'Username',
                                ),
                                controller: controller.usernameController,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 55,
                              child: TextField(
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(7.5)),
                                  ),
                                  filled: true,
                                  floatingLabelAlignment: FloatingLabelAlignment.start,
                                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                                  labelText: 'Password',
                                ),
                                controller: controller.passwordController,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: ItemButtonWidget(
                          isDisable: controller.loginStatus.value == LoginStatus.loading,
                          onPressed: controller.login,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Dont have an account?',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.REGISTER);
                            },
                            child: const Text(
                              ' Click here',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
