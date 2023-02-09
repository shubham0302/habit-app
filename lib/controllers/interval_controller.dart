import 'dart:developer';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/infrastructure/model/interval_model.dart';

class IntervalTabController extends GetxController {
  final CountDownController controller = CountDownController();

  RxBool paused = false.obs;
  RxBool isSound = false.obs;
  RxBool isVibration = false.obs;
  pause() {
    controller.pause();
    paused.value = true;
  }

  resumed() {
    controller.resume();
    paused.value = false;
  }

  var intervalInd = 0.obs;
  var indexPos = 0.obs;
  // var isStop = false.obs;
  startInterval() {
    if (loopI.value == 0) {
      if (indexPos.value < intervals.length) {
        controller.restart(
            duration: intervals[indexPos.value].getTotalSceconds());
        print(intervals[indexPos.value].getTotalSceconds());
        indexPos.value = indexPos.value + 1;
      } else {
        indexPos.value = 0;
        intervalInd.value = intervalInd.value + 1;
        print('here');
        startInterval();
        // controller.start();
      }
      // controller.start();
      print('objecdt');
    } else {
      if (intervalInd.value < loopI.value) {
        if (indexPos.value < intervals.length) {
          print('enter');
          controller.restart(
              duration: intervals[indexPos.value].getTotalSceconds());
          print(intervals[indexPos.value].getTotalSceconds());
          indexPos.value = indexPos.value + 1;
        } else {
          indexPos.value = 0;
          intervalInd.value = intervalInd.value + 1;

          print('here');
          startInterval();
          // controller.start();
        }
      } else {
        indexPos.value = 0;
        intervalInd.value = 0;
        loopI.value = 0;
        print('exit');

        // start.value = false;
        controller.reset();
        // var isStop = false.obs;
      }
    }
  }
  // startInterval() {
  //   if (loopI.value == 0) {
  //     if (indexPos.value < intervals.length) {
  //       log('ere');
  //       controller.restart(
  //           duration: intervals[indexPos.value].getTotalSceconds());
  //       indexPos.value = indexPos.value + 1;
  //       loopIterator.value = loopIterator.value + 1;
  //     } else {
  //       indexPos.value = 0;
  //       controller.restart(
  //           duration: intervals[indexPos.value].getTotalSceconds());
  //     }
  //   } else if (loopI.value >= loopIterator.value) {
  //     if (indexPos.value < intervals.length) {
  //       log('ere fjfj ${indexPos.value} ${loopI.value} ${loopIterator.value}');
  //       controller.restart(
  //           duration: intervals[indexPos.value].getTotalSceconds());
  //       indexPos.value = indexPos.value + 1;
  //     } else {
  //       log('ere fjfjf ddffd ${indexPos.value} ${loopI.value} ${loopIterator.value}');
  //       indexPos.value = 1;
  //       controller.restart(duration: intervals[0].getTotalSceconds());
  //       loopIterator.value = loopIterator.value + 1;
  //     }
  //     // loopIterator.value = loopIterator.value + 1;
  //   } else {
  //     log('ere fjfjf ddffd fdfd ${indexPos.value} ${loopI.value} ${loopIterator.value}');
  //     controller.reset();
  //     start.value = false;
  //     indexPos.value = 0;
  //     loopIterator.value = 0;
  //   }
  // }

  var loopI = 0.obs;
  var loopIterator = 0.obs;

  stop() {
    indexPos.value = 0;
    controller.reset();
    start.value = false;
  }

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

  var start = false.obs;

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

  // var loopSeconds = 0.obs;
  // var loopIndex = 0.obs;
  // late AnimationController animationController;
  // startLoop(TickerProvider vsync, AnimationController ctrl) {
  //   if (loopIndex.value == 0) {
  //     return;
  //   } else {
  //     ctrl = AnimationController(
  //         vsync: vsync,
  //         duration:
  //             Duration(seconds: intervals[loopIndex.value].getTotalSceconds()));
  //     if (loopIndex.value < intervals.length - 1) {
  //       loopIndex.value = loopIndex.value + 1;
  //     } else {
  //       loopIndex.value = 0;
  //     }
  //     startLoop(vsync, ctrl);
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
  }
}
