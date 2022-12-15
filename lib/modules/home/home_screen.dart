import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/modules/home/home_controller.dart';
import 'package:getx_architecture/modules/home/home_detail/detail_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Welcomeee!",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            buildTextFormField(controller.heightEditingController, 40, 300, "Enter Height", "cm"),
            buildTextFormField(controller.weightEditingController, 10, 120, "Enter Weight", "kg"),
            buildGesture(),
            buildSizedBox(20),
          ],
        ),
      )),
    );
  }

  SizedBox buildSizedBox(int height) {
    return SizedBox(
      height: height.h,
    );
  }

  GestureDetector buildGesture() {
    return GestureDetector(
      onTap: () {
        controller.calculateBMI(double.parse(controller.weightEditingController.text), double.parse(controller.heightEditingController.text));
        Get.to(BMIDetail());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 1.h),
        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10.sp)),
        child: Text(
          "Calculate BMI",
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
      ),
    );
  }

  SizedBox buildTextFormField(TextEditingController textEditingController, int minValue, int maxValue, String hintText, String suffixText) {
    return SizedBox(
      width: 90.w,
      child: TextFormField(
        controller: textEditingController,
        keyboardType: TextInputType.number,
        validator: (value) {
          controller.inputControl(minValue, maxValue, value.toString());
        },
        inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(3)],
        decoration: InputDecoration(hintText: hintText, suffixText: suffixText, border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
      ),
    );
  }
}
