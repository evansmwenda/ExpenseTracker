import 'package:get/get.dart';


class HomeController extends GetxController{
  final _tabIndex = 0.obs;
  int get tabIndex => _tabIndex.value;

  changeIndex({required int index}) {
    _tabIndex.value = index;
  }
}