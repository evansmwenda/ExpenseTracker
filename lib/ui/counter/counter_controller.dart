import 'package:get/get.dart';

class CounterController extends GetxController{
  final _count = 0.obs;
  int get count => _count.value;

  updateCount(){
    _count.value ++;
  }




}