// // ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
// import 'package:get/get.dart';
// import 'package:habbit_app/controllers/interval_controller.dart';

// import '../../widgets/text_widget/label_text.dart';
// import '../../widgets/text_widget/main_label_text.dart';

// class IntervalTimerStartScreen extends StatefulWidget {
//   const IntervalTimerStartScreen({super.key});

//   @override
//   State<IntervalTimerStartScreen> createState() =>
//       _IntervalTimerStartScreenState();
// }

// class _IntervalTimerStartScreenState extends State<IntervalTimerStartScreen>
//     with TickerProviderStateMixin {
//   AnimationController? animationController;
//   IntervalTabController intervalTabController =
//       Get.put(IntervalTabController(), permanent: false);

//   late TabController _controller;

//   bool isPlaying = false;
//   String get countText {
//     Duration count =
//         animationController!.duration! * animationController!.value;
//     return animationController!.isDismissed
//         ? '${animationController!.duration!.inHours}:${(animationController!.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(animationController!.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
//         : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
//   }

//   @override
//   void dispose() {
//     animationController!.dispose();
//     super.dispose();
//   }

//   double progress = 1.0;

//   void notifiy() {
//     if (countText == "0:00:00") {
//       FlutterRingtonePlayer.playNotification();
//     }
//   }

//   IntervalTabController tabController =
//       Get.put(IntervalTabController(), permanent: false);
//   @override
//   void initState() {
//     // ignore: todo
//     // TODO: implement initState
//     super.initState();
//     _controller =
//         TabController(length: tabController.intervals.length, vsync: this);
//     _controller.addListener(() {
//       // tabController
//       //     .startLoop(tabController.intervals.length, tabController.totalSeconds)
//       //     .value = _controller.index;
//       // print(tabController.tabIndex.value);
//     });
//     super.initState();
//     // tabController.startLoop(this, animationController!);
//     // animationController = AnimationController(
//     //     vsync: this, duration: Duration(seconds: tabController.totalSeconds));
//     animationController!.addListener(() {
//       notifiy();
//       // animationController.
//       if (animationController!.isAnimating) {
//         setState(() {
//           progress = animationController!.value;
//         });
//       } else {
//         setState(() {
//           progress = 1.0;
//           isPlaying = false;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     IntervalTabController intervalTabController =
//         Get.put(IntervalTabController(), permanent: false);
//     var progress = 1.0;
//     ThemeData color = Theme.of(context);
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // start timer screen
//           Container(
//             height: 350,
//             width: MediaQuery.of(context).size.width,
//             // color: color.cardColor,
//             child: Column(children: [
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   SizedBox(
//                       width: 300,
//                       height: 300,
//                       child: CircularProgressIndicator(
//                         color: color.primaryColor,
//                         backgroundColor: color.disabledColor.withOpacity(0.6),
//                         value: progress,
//                         strokeWidth: 10,
//                       )),
//                   GestureDetector(
//                     onTap: () {
//                       if (animationController!.isDismissed) {
//                         showModalBottomSheet(
//                             context: context,
//                             builder: (context) => Container(
//                                   height: 300,
//                                   child: CupertinoTimerPicker(
//                                     initialTimerDuration:
//                                         animationController!.duration!,
//                                     backgroundColor: color.backgroundColor,
//                                     onTimerDurationChanged: (time) {
//                                       setState(() {
//                                         animationController!.duration = time;
//                                       });
//                                     },
//                                   ),
//                                 ));
//                       }
//                     },
//                     child: AnimatedBuilder(
//                       animation: animationController!,
//                       builder: (context, child) => Text(
//                         countText,
//                         style: TextStyle(
//                             fontSize: 60,
//                             fontWeight: FontWeight.bold,
//                             color: color.primaryColor),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ]),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   print(intervalTabController.intervals);
//                   if (animationController!.isAnimating) {
//                     animationController!.stop();
//                     setState(() {
//                       isPlaying = false;
//                     });
//                   } else {
//                     animationController!.reverse(
//                         from: animationController!.value == 0
//                             ? 1.0
//                             : animationController!.value);
//                     setState(() {
//                       isPlaying = true;
//                     });
//                   }
//                 },
//                 child: Container(
//                   height: 35,
//                   width: 90,
//                   decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.all(Radius.circular(30)),
//                       color: color.primaryColor),
//                   child: Center(child: LabelText(text: "Start".tr)),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   animationController!.reset();
//                   intervalTabController.currentvalueHour.value = 0;
//                   intervalTabController.currentvalueMin.value = 0;
//                   intervalTabController.currentvalueSec.value = 0;
//                   setState(() {
//                     isPlaying = false;
//                   });
//                   intervalTabController.changeFirst2();
//                 },
//                 child: Container(
//                   height: 35,
//                   width: 90,
//                   decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.all(Radius.circular(30)),
//                       color: color.disabledColor.withOpacity(0.7)),
//                   child: GestureDetector(
//                       onTap: () {
//                         intervalTabController.start.value == true
//                             ? intervalTabController.start.value = false
//                             : intervalTabController.start.value = true;
//                       },
//                       child: Center(child: MainLabelText(text: "Delete".tr))),
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
