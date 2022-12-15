import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/modules/home/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        controller.data.toString(),
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 32),
      )),
    );
  }
}
