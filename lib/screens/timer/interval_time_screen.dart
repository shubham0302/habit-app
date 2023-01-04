// ignore_for_file: depend_on_referenced_packages, sized_box_for_whitespace, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/interval_controller.dart';
import 'package:habbit_app/controllers/timer_tab_controller.dart';
import 'package:habbit_app/screens/timer/select_interval_dailbox.dart';
import 'package:habbit_app/screens/timer/set_interval_component.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

class IntervalTimeScreen extends StatefulWidget {
  const IntervalTimeScreen({super.key});

  @override
  State<IntervalTimeScreen> createState() => _IntervalTimeScreenState();
}

class _IntervalTimeScreenState extends State<IntervalTimeScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  IntervalTabController intervalTabController =
      Get.put(IntervalTabController(), permanent: false);

  late TabController _controller;

  bool isPlaying = false;

  // int get countText2 {
  //   int count = tabController.totalSeconds;
  //   return;
  // }

  String get countText {
    Duration count = animationController.duration! * animationController.value;
    return animationController.isDismissed
        ? '${animationController.duration!.inHours}:${(animationController.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(animationController.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  double progress = 1.0;

  void notifiy() {
    if (countText == "0:00:00") {
      FlutterRingtonePlayer.playNotification();
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    IntervalTabController tabController =
        Get.put(IntervalTabController(), permanent: false);
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() {
      tabController.tabIndex.value = _controller.index;
      // print(tabController.tabIndex.value);
    });
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(seconds: tabController.totalSeconds));
    animationController.addListener(() {
      notifiy();
      if (animationController.isAnimating) {
        setState(() {
          progress = animationController.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    IntervalTabController intervalTabController =
        Get.put(IntervalTabController(), permanent: false);
    var color = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: color.disabledColor.withOpacity(0.1)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DescriptionText(text: "Intervals"),
                  SH.medium(),
                  Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    child: Obx(
                      () => ListView.separated(
                          itemBuilder: (context, index) {
                            return Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: color.backgroundColor),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          LabelText(
                                              text:
                                                  '${intervalTabController.intervals[index].hour}:${intervalTabController.intervals[index].min}:${intervalTabController.intervals[index].sec}'),
                                          SW.medium(),
                                          DescriptionText(
                                              text: intervalTabController
                                                      .intervals[index].breaktog
                                                  ? "break"
                                                  : '')
                                        ],
                                      ),
                                      Icon(
                                        Icons.delete_outline,
                                        color: color.disabledColor,
                                        size: 20,
                                      )
                                    ]),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SH.small(),
                          itemCount: intervalTabController.intervals.length),
                    ),
                  ),
                  // Container(
                  //   height: 40,
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.all(Radius.circular(10)),
                  //       color: color.backgroundColor),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Row(
                  //             children: [
                  //               LabelText(text: '00:05'),
                  //               SW.medium(),
                  //               DescriptionText(text: 'Break')
                  //             ],
                  //           ),
                  //           Icon(
                  //             Icons.delete_outline,
                  //             color: color.disabledColor,
                  //             size: 20,
                  //           )
                  //         ]),
                  //   ),
                  // ),
                  SH.medium(),

                  GestureDetector(
                    onTap: () {
                      SelectInterTimeCustomDialogBox(context);
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: color.backgroundColor),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: LabelText(
                            text: 'ADD INTERVAL',
                            isBold: true,
                            isColor: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SH.medium(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabelText(
                            text: 'Loops',
                            isBold: true,
                            isColor: true,
                          ),
                          SH.small(),
                          DescriptionText(text: '0 = Unlimited')
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: color.backgroundColor),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: LabelText(
                              text: '1',
                              isBold: true,
                              // isColor: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
          ),
        ),
        SH.large(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 40,
            width: 100,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: color.primaryColor),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  intervalTabController.start.value == true
                      ? intervalTabController.start.value = false
                      : intervalTabController.start.value = true;
                  print(intervalTabController.start.value);
                },
                child: LabelText(
                  text: "Start",
                  isBold: true,
                  // isColor: true,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
