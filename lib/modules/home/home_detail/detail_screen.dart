import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/modules/home/home_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BMIDetail extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        buildSizedBox(10),
        Container(
          margin: EdgeInsets.only(left: 5.w),
          width: 90.w,
          height: 60.h,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(children: [
            buildSizedBox(5),
            SizedBox(
              height: 6.h,
              width: 100.w,
              child: Text(
                "Your BMI is",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 40, fontWeight: FontWeight.w500),
              ),
            ),
            buildSizedBox(3),
            SizedBox(
              height: 12.h,
              width: 70.w,
              child: RichText(
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                text: TextSpan(
                  text: controller.result.toString(),
                  style: TextStyle(color: Colors.green.withBlue(109), fontSize: 90, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            buildSizedBox(4),
            Container(
              height: 10.h,
              width: 70.w,
              alignment: Alignment.center,
              child: controller.explanation(),
            ),
            buildExplanations(20, 70, TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 16), controller.explanation2()!),
          ]),
        ),
        buildSizedBox(20),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.only(left: 5.w),
            alignment: Alignment.center,
            height: 7.h,
            width: 80.w,
            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: Colors.blue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.refresh_rounded,
                  color: Colors.white,
                ),
                buildSizedBoxWidth(2),
                const Text(
                  "Start over",
                  style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Container buildExplanations(int height, int width, TextStyle? textStyle, String explanation) {
    return Container(
      height: height.h,
      width: width.w,
      alignment: Alignment.center,
      child: Text(explanation, style: textStyle),
    );
  }

  SizedBox buildSizedBox(int height) {
    return SizedBox(
      height: height.h,
    );
  }

  SizedBox buildSizedBoxWidth(int width) {
    return SizedBox(
      width: width.h,
    );
  }
}
