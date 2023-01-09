// ignore_for_file: depend_on_referenced_packages, sized_box_for_whitespace, avoid_print, unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_is_empty

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/interval_controller.dart';
import 'package:habbit_app/screens/timer/select_interval_dailbox.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:habbit_app/widgets/custom_snackbar.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

class IntervalTimeScreen extends StatefulWidget {
  const IntervalTimeScreen({super.key});

  @override
  State<IntervalTimeScreen> createState() => _IntervalTimeScreenState();
}

class _IntervalTimeScreenState extends State<IntervalTimeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  IntervalTabController intervalTabController =
      Get.put(IntervalTabController(), permanent: false);

  late TabController _controller;

  bool isPlaying = false;

  // int get countText2 {
  //   int count = tabController.totalSeconds;
  //   return;
  // }

  String get countText {
    Duration count =
        animationController!.duration! * animationController!.value;
    return animationController!.isDismissed
        ? '${animationController!.duration!.inHours}:${(animationController!.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(animationController!.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    animationController!.dispose();
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
    animationController!.addListener(() {
      notifiy();
      if (animationController!.isAnimating) {
        setState(() {
          progress = animationController!.value;
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
    final CountDownController _controller = CountDownController();
    IntervalTabController intervalTabController =
        Get.put(IntervalTabController(), permanent: false);
    var color = Theme.of(context);
    return SingleChildScrollView(
      child: Container(
        // alignment: Alignment.center,
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height / 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Container(
                alignment: Alignment.center,
                // height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: intervalTabController.start.value == true
                        ? null
                        : color.disabledColor.withOpacity(0.1)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => intervalTabController.start.value == true
                            ? Container(
                                height: 250,
                                width: 250,
                                child: CircularCountDownTimer(
                                  strokeWidth: 10,
                                  controller: intervalTabController.controller,
                                  isReverse: true,
                                  // autoStart: false,
                                  textStyle: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  // textFormat: intervalTabController.intervals[
                                  //                 intervalTabController
                                  //                     .indexPos.value]
                                  //             .getTotalSceconds() >=
                                  //         3600
                                  //     ? CountdownTextFormat.HH_MM_SS
                                  //     : intervalTabController.intervals[
                                  //                     intervalTabController
                                  //                         .indexPos.value]
                                  //                 .getTotalSceconds() >=
                                  //             60
                                  //         ? CountdownTextFormat.MM_SS
                                  //         : CountdownTextFormat.SS,
                                  duration: intervalTabController.intervals[0]
                                      .getTotalSceconds(),
                                  height: 100,
                                  width: 100,
                                  onComplete: () {
                                    intervalTabController.startInterval();
                                  },
                                  fillColor: color.disabledColor,
                                  ringColor: color.primaryColor,
                                ),
                              )
                            : const SizedBox(),
                      ),
                      intervalTabController.start.value == true
                          ? const SizedBox()
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  const DescriptionText(text: "Intervals"),
                                  SH.medium(),
                                  Container(
                                    height: 90,
                                    width: MediaQuery.of(context).size.width,
                                    child: Obx(
                                      () => intervalTabController
                                              .intervals.isEmpty
                                          ? Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.timer_outlined,
                                                    color: color.disabledColor
                                                        .withAlpha(100),
                                                    size: 30,
                                                  ),
                                                  SH.small(),
                                                  const DescriptionText(
                                                    text:
                                                        'There are no custom categories',
                                                    // isBold: true,
                                                  ),
                                                ],
                                              ),
                                            )
                                          : ListView.separated(
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  height: 40,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  10)),
                                                      color: color
                                                          .backgroundColor),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              LabelText(
                                                                  text:
                                                                      '${intervalTabController.intervals[index].hour}:${intervalTabController.intervals[index].min}:${intervalTabController.intervals[index].sec}'),
                                                              SW.medium(),
                                                              DescriptionText(
                                                                  text: intervalTabController
                                                                          .intervals[
                                                                              index]
                                                                          .breaktog
                                                                      ? "break"
                                                                      : '')
                                                            ],
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              intervalTabController
                                                                  .intervals
                                                                  .removeAt(
                                                                      index);
                                                            },
                                                            behavior:
                                                                HitTestBehavior
                                                                    .translucent,
                                                            child: Icon(
                                                              Icons
                                                                  .delete_outline,
                                                              color: color
                                                                  .disabledColor,
                                                              size: 20,
                                                            ),
                                                          )
                                                        ]),
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) =>
                                                      SH.small(),
                                              itemCount: intervalTabController
                                                  .intervals.length),
                                    ),
                                  ),
                                  SH.medium(),
                                  GestureDetector(
                                    onTap: () {
                                      SelectInterTimeCustomDialogBox(context);
                                    },
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          color: color.backgroundColor),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const LabelText(
                                            text: 'Loops',
                                            isBold: true,
                                            isColor: true,
                                          ),
                                          SH.small(),
                                          const DescriptionText(
                                              text: '0 = Unlimited')
                                        ],
                                      ),
                                      SizedBox(
                                          width: 80,
                                          child: InputField(
                                            hintText: '0',
                                            textType: TextInputType.number,
                                            onChange: (e) {
                                              intervalTabController
                                                  .loopI.value = int.parse(e);
                                            },
                                          ))
                                    ],
                                  )
                                ]),
                    ],
                  ),
                ),
              ),
            ),
            SH.large(),
            Obx(
              () => intervalTabController.start.value == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              intervalTabController.paused.value == true
                                  ? intervalTabController.resumed()
                                  : intervalTabController.pause();
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: color.primaryColor),
                              child: Center(
                                child: LabelText(
                                  text:
                                      intervalTabController.paused.value == true
                                          ? 'Resume'
                                          : "Pause",
                                  isBold: true,
                                  isColor: true,
                                  color: Colors.white,
                                  // isColor: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              intervalTabController.indexPos.value = 0;
                              intervalTabController.controller.reset();
                              intervalTabController.start.value = false;
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: color.primaryColor),
                              child: const Center(
                                child: LabelText(
                                  text: "Stop",
                                  isBold: true,
                                  isColor: true,
                                  color: Colors.white,
                                  // isColor: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          if (intervalTabController.intervals.length > 0) {
                            intervalTabController.start.value = true;
                            intervalTabController.startInterval();
                          } else {
                            CustomSnackbar.errorSnackbar2(
                                'please add interval', context);
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: color.primaryColor),
                          child: const Center(
                            child: LabelText(
                              text: "Start",
                              isBold: true,
                              isColor: true,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
