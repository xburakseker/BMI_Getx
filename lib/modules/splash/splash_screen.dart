import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/modules/home/home_controller.dart';

class SplashScrenn extends GetView<HomeController> {
  const SplashScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.flutter_dash,
          size: 72,
        ),
      ),
    );
  }
}
