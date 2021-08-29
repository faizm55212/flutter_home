import 'dart:async';
import 'package:get/get.dart';

class AnimeController extends GetxController {
  Rx<double> tickerValue = 10.toDouble().obs;
  @override
  void onInit() {
    Timer(Duration(milliseconds: 256), () {
      Timer.periodic(Duration(milliseconds: 10), (timer) {
        if (tickerValue.value < 100) {
          tickerValue.value = tickerValue.value + 10;
        }
      });
    });
    super.onInit();
  }
}
