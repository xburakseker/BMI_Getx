import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/modules/home/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScrenn extends GetView<HomeController> {
  const SplashScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "BMI\nCALCULATOR",
        textAlign: TextAlign.center,
        style: GoogleFonts.inder(
            color: Theme.of(context).colorScheme.background, fontSize: 28.sp),
      )),
    );
  }
}
