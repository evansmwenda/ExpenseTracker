import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'daily_controller.dart';

class DailyView extends GetView<DailyController> {
  const DailyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff5f5f5),
    child: Center(
  child: Text("DailyView"),
  ),
    );
  }
}
