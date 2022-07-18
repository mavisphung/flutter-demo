import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_navigation_bar/pages/history/history_controller.dart';

class HistoryPage extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'History Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
