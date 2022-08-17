import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'daily_controller.dart';

class DailyView extends GetView<DailyController> {
  const DailyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    color: Colors.red,
    child: Center(
  child: Text("DailyView"),
  ),
    );
  }
}
