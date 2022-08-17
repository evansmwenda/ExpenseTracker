import 'package:get/get.dart';

import '../ui/counter/counter_controller.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounterController>(() => CounterController());
  }
}