import 'package:get/get.dart';


class StatsController extends GetxController{
  final _tabIndex = 0.obs;
  int get tabIndex => _tabIndex.value;

  changeMonthIndex({required int index}) {
    _tabIndex.value = index;
  }

}