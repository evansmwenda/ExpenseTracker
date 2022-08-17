import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'budget_controller.dart';

class BudgetView extends GetView<BudgetController> {
  const BudgetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("BudgetView"),
      ),
    );
  }
}
