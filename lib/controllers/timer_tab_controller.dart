import 'package:get/get.dart';

class TimerTabController extends GetxController {
  var tabIndex = 0.obs;

  var currentvalueHour = 0.obs;
  var currentvalueMin = 0.obs;
  var currentvalueSec = 0.obs;
  var isFirst = true.obs;

  int get totalSeconds =>
      (currentvalueHour.value * 3600) +
      (currentvalueMin.value * 60) +
      currentvalueSec.value;

  changeFirst() {
    isFirst.value = false;
  }

  changeFirst2() {
    isFirst.value = true;
  }
}
