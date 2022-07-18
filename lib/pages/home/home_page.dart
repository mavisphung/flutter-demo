import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_navigation_bar/pages/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(controller.title);
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.title.value,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
