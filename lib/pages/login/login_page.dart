import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_navigation_bar/pages/login/login_controller.dart';
import 'package:getx_navigation_bar/routes/app_routes.dart';
import 'package:getx_navigation_bar/widgets/item_button_widget.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7.5)),
                                  ),
                                  filled: true,
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.start,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  labelText: 'Username',
                                ),
                                controller: loginController.usernameController,
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7.5)),
                                  ),
                                  filled: true,
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.start,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  labelText: 'Password',
                                ),
                                controller: loginController.passwordController,
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
                          isDisable: loginController.loginStatus.value ==
                              LoginStatus.loading,
                          onPressed: () async {
                            print(
                                'status: ${loginController.loginStatus.value}');
                            loginController.updateUI(LoginStatus.loading);
                            var response = await client.post(
                              Uri.http(baseUrl, '/login/'),
                              body: {
                                'email': loginController
                                    .usernameController.value.text,
                                'password': loginController
                                    .passwordController.value.text,
                                'type': loginController.type,
                              },
                            );

                            var decodedResponse =
                                jsonDecode(utf8.decode(response.bodyBytes))
                                    as Map<String, dynamic>;
                            if (response.statusCode >= 400) {
                              Get.snackbar(
                                'Login Error',
                                '${decodedResponse["message"]}',
                                margin: const EdgeInsets.all(12.0),
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                              );
                              loginController.updateUI(LoginStatus.error);
                              print(
                                  'status: ${loginController.loginStatus.value}');
                              return;
                            }
                            Get.snackbar(
                              'Login to app',
                              'Welcome back, ${decodedResponse["data"]["firstName"]}',
                              margin: const EdgeInsets.all(12.0),
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.lightGreen,
                            );
                            loginController.updateUI(LoginStatus.init);
                            print(
                                'status: ${loginController.loginStatus.value}');
                            Get.offNamed(AppRoutes.DASHBOARD);
                            // print(decodedResponse);
                            // Get.snackbar(
                            //   'Login',
                            //   'User ${loginController.usernameController.value.text}',
                            //   margin: const EdgeInsets.all(12.0),
                            //   snackPosition: SnackPosition.BOTTOM,
                            //   backgroundColor: Colors.lightGreen,
                            // );
                          },
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
