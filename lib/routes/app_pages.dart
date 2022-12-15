// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:getx_architecture/modules/home/home_binding.dart';
import 'package:getx_architecture/modules/home/home_screen.dart';
import 'package:getx_architecture/modules/splash/splash_binding.dart';
import 'package:getx_architecture/modules/splash/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;
  static const SPLASH = Routes.SPLASH;

  static final routes = [
    GetPage(name: Routes.HOME, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(name: Routes.SPLASH, page: () => const SplashScrenn(), binding: SplashBinding()),
  ];
}
