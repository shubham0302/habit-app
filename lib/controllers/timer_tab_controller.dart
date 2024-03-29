import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:get/get.dart';

class TimerTabController extends GetxController {
  RxBool paused = false.obs;
  pause() {
    controller.pause();
    paused.value = true;
  }

  resumed() {
    controller.resume();
    paused.value = false;
  }

  final CountDownController controller = CountDownController();

  RxBool animation = false.obs;
  var tabIndex = 0.obs;

  var changeTabIdex = 0.obs;

  var currentvalueHour = 0.obs;
  var currentvalueMin = 0.obs;
  var currentvalueSec = 0.obs;
  var stopWatchSec = 0.obs;
  var stopWatchMin = 0.obs;
  var stopWatchHour = 0.obs;
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
