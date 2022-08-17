import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/controller_binding.dart';
import 'ui/counter/counter_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      debugShowCheckedModeBanner: false,
      enableLog: true,
      smartManagement: SmartManagement.keepFactory,
      home: CounterPage(),
    );
  }
}


