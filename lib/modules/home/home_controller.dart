import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/routes/app_pages.dart';

class HomeController extends GetxController {
  String? data;

  RxBool isDark = false.obs;

  TextEditingController heightEditingController = TextEditingController();
  TextEditingController weightEditingController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  RxDouble result = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    data = Get.parameters['data'];
  }

  calculateBMI(double weight, double height) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (weightEditingController.text != '' &&
          heightEditingController.text != '') {
        weight = double.parse(weightEditingController.text);
        height = double.parse(heightEditingController.text);
        result.value = (weight / ((height / 100) * (height / 100)));
        Get.toNamed(Routes.BMI_DETAIL);
      } else {
        Fluttertoast.showToast(
          msg: "Please enter values",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      }
    }
  }

  changeTheme() {
    isDark.value = !isDark.value;
    isDark.value
        ? Get.changeTheme(ThemeData.dark())
        : Get.changeTheme(ThemeData.light());
  }

  inputControl(int minValue, int maxValue, String value) {
    if (value.isEmpty == false) {
      if (double.parse(value) < minValue) {
        return 'Too small value';
      } else if (double.parse(value) > maxValue) {
        return 'Too big value';
      }
      return null;
    } else {
      return "it is empty";
    }
  }

  String? explanation2() {
    if (result < 18.5) {
      return "You are underweight, you may need to put on some weight. You are recommend to ask your doctor or a dietitian for advice.";
    } else if (result < 25 && result >= 18.5) {
      return "You are at a healthy weight for your height. By maintaining a healthy weight, you lower your risk of developing serious health problems.";
    } else if (result < 30 && result >= 25) {
      return "You are slightly overweight. You may be advised to lose some weight for health reasons. You are recommended to talk to your doctor or a dietitian for advice.";
    } else if (result < 35 && result >= 30) {
      return "You are heavily overweight. Your health may be at risk if you do not lose weight. You are recommened to talk your doctor or a dietitian for advice.";
    } else if (result >= 35) {
      return "Seek advice from a weight managment practitioner quickly.";
    } else {
      return "WRONG VALUES";
    }
  }

  Text explanation() {
    if (result < 18.5) {
      return const Text(
        "UNDERWEIGHT",
        style: TextStyle(
            color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
      );
    } else if (result < 25 && result >= 18.5) {
      return const Text(
        "NORMAL",
        style: TextStyle(
            color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold),
      );
    } else if (result < 30 && result >= 25) {
      return Text(
        "OVERWEIGHT",
        style: TextStyle(
            color: Colors.green.shade800,
            fontSize: 26,
            fontWeight: FontWeight.bold),
      );
    } else if (result < 35 && result >= 30) {
      return Text(
        "OBESE",
        style: TextStyle(
            color: Colors.red.shade600,
            fontSize: 30,
            fontWeight: FontWeight.bold),
      );
    } else if (result >= 35) {
      return Text(
        "EXTREMELY\nOBESE",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.red.shade700,
            fontSize: 34,
            fontWeight: FontWeight.bold),
      );
    } else {
      return const Text(
        "WRONG VALUES",
        style: TextStyle(color: Colors.black),
      );
    }
  }
}
