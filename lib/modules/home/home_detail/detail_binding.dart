import 'package:get/get.dart';
import 'package:getx_architecture/modules/home/home_controller.dart';

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
