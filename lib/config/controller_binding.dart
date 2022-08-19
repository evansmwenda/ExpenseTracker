import 'package:get/get.dart';
import '../ui/auth/auth_controller.dart';
import '../ui/counter/counter_controller.dart';
import '../ui/home/home_controller.dart';
import '../ui/home/tabs/budget/budget_controller.dart';
import '../ui/home/tabs/daily/daily_controller.dart';
import '../ui/home/tabs/profile/profile_controller.dart';
import '../ui/home/tabs/stats/stats_controller.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<CounterController>(() => CounterController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DailyController>(() => DailyController());
    Get.lazyPut<StatsController>(() => StatsController());
    Get.lazyPut<BudgetController>(() => BudgetController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}