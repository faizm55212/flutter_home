import 'package:flutter/material.dart';
import 'package:flutter_home/controller/tab_controller.dart';
import 'package:flutter_home/screens/control_panel.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var tabController = Get.put<MyTabController>(MyTabController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color(0xFF00579E)),
      home: ControlPanel(),
    );
  }
}
