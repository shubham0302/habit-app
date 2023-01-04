import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/infrastructure/model/interval_model.dart';

class IntervalTabController extends GetxController {
  RxBool breakSwitch = false.obs;

  var tabIndex = 0.obs;

  var currentvalueHour = 0.obs;
  var currentvalueMin = 0.obs;
  var currentvalueSec = 0.obs;

  RxList<IntervalModel> intervals = <IntervalModel>[].obs;

  addInterval(int hr, int min, int sec, bool br) {
    intervals.add(IntervalModel(min: min, sec: sec, hour: hr, breaktog: br));
    intervals.refresh();
  }

  var isFirst = true.obs;

  var start = true.obs;

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

  var loopSeconds = 0.obs;
  var loopIndex = 0.obs;
  late AnimationController animationController;
  startLoop(TickerProvider vsync, AnimationController ctrl) {
    if (loopIndex.value == 0) {
      return;
    } else {
      ctrl = AnimationController(
          vsync: vsync,
          duration:
              Duration(seconds: intervals[loopIndex.value].getTotalSceconds()));
      if (loopIndex.value < intervals.length - 1) {
        loopIndex.value = loopIndex.value + 1;
      } else {
        loopIndex.value = 0;
      }
      startLoop(vsync, ctrl);
    }
  }
}
