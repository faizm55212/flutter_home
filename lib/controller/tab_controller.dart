import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MyTabController extends GetxController with SingleGetTickerProviderMixin {
  TabController? controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: 3);
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
}
