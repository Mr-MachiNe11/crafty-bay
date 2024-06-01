import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainBottomNavBarController());
  }
}
