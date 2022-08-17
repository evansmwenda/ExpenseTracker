import 'package:expense_tracker/ui/counter/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterController c = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker',),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Counter value:-"),
            Obx(() => Text(c.count.toString())),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          c.updateCount();
        },
        child: const Center(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}