import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'stats_controller.dart';

class StatsView extends GetView<StatsController> {
  const StatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Center(
        child: Text("StatsView"),
      ),
    );
  }
}
