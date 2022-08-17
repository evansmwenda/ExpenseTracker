import 'package:get/get.dart';
import '../ui/counter/counter_controller.dart';
import '../ui/home/home_controller.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounterController>(() => CounterController());
    Get.lazyPut<HomeController>(() => HomeController());
    // Get.lazyPut<DailyController>(() => DailyController());
    // Get.lazyPut<StatsController>(() => StatsController());
    // Get.lazyPut<BudgetController>(() => BudgetController());
    // Get.lazyPut<ProfileController>(() => ProfileController());
  }
}