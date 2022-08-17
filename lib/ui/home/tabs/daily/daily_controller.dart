import 'package:get/get.dart';


class DailyController extends GetxController{

  final _selectedDay = DateTime.now().obs;
  DateTime get selectedDay => _selectedDay.value;


  changeSelectedDay(var value){
    print("selected value $value");
    _selectedDay.value = value;
    update();
  }

}