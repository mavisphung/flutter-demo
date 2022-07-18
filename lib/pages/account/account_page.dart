import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_navigation_bar/pages/account/account_controller.dart';

class AccountPage extends GetView<AccountController> {
  AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text('Counter ${controller.counter.value}')),
            ElevatedButton(
              onPressed: () {
                controller.increaseCounter();
              },
              child: const Text('Increase'),
            ),
          ],
        ),
      ),
    );
  }
}
