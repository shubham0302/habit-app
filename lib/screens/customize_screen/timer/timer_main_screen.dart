import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:habbit_app/main.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/button_text.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

class TimerMainScreen extends StatefulWidget {
  const TimerMainScreen({super.key});

  @override
  State<TimerMainScreen> createState() => _TimerMainScreenState();
}

class _TimerMainScreenState extends State<TimerMainScreen> {
  int second = 0, minutes = 0, hours = 0;
  String digitSecound = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;
  List laps = [];

  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void reset() {
    timer!.cancel();
    setState(() {
      second = 0;
      minutes = 0;
      hours = 0;

      digitSecound = "00";
      digitMinutes = "00";
      digitHours = "00";

      started = false;
    });
  }

  void addLaps() {
    String lap = "$digitHours:$digitMinutes:$digitSecound";
    setState(() {
      laps.add(lap);
    });
  }

  void start() {
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSecound = second + 1;
      int localMinute = minutes;
      int localHour = hours;

      if (localSecound > 59) {
        if (localMinute > 59) {
          localHour++;
          localMinute = 0;
        } else {
          localMinute++;
          localSecound = 0;
        }
      }
      setState(() {
        second = localSecound;
        minutes = localMinute;
        hours = localHour;
        digitSecound = (second >= 10) ? "$second" : "0$second";
        digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
        digitHours = (hours >= 10) ? "$hours" : "0$hours";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData color = Theme.of(context);
    return Column(children: [
      SH.large(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: color.disabledColor.withOpacity(0.3)),
            child: const LabelText(
              text: "Stopwatch",
              isColor: true,
            ),
          ),
          const LabelText(text: "Timer"),
          const LabelText(text: "Intervals")
        ],
      ),
      SH.large(),
      Column(
        children: [
          SH.medium(),
          HeadingText(
            text: "${digitHours}:${digitMinutes}:${digitSecound}",
            isColor: T,
          ),
          SH.medium(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HeadingText(text: "Laps           "),
              HeadingText(text: "Time"),
            ],
          ),
          SH.large(),
          Container(
            // color: Colors.green,
            height: MediaQuery.of(context).size.height / 2.6,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: laps.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MainLabelText(text: "${index + 1}"),
                    SW.medium(),
                    MainLabelText(text: "${laps[index]}")
                  ],
                );
              },
            ),
          ),
          SH.large(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  !started ? start() : stop();
                },
                child: Container(
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: color.primaryColor),
                  child: Center(
                      child: HeadingText(
                    text: !started ? "Start" : "Pause",
                    isWhite: false,
                    // isWhite: true,
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  addLaps();
                },
                child: Icon(
                  Icons.flag,
                  size: 40,
                  color: color.primaryColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  reset();
                  laps.length = 0;
                },
                child: Container(
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: color.disabledColor.withOpacity(0.2)),
                  child: Center(child: HeadingText(text: "Reset")),
                ),
              ),
            ],
          )
        ],
      )
    ]);
  }
}
