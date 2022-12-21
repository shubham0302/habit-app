import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/screens/habbit/datechip.dart';

import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/des_text.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

class HabbitsScreen extends StatelessWidget {
  const HabbitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData color = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/addhabbit");
        },
        backgroundColor: color.primaryColor,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed('/habbit-detail');
                },
                child: Column(children: [
                  Container(
                    // height: 210,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: color.dialogBackgroundColor.withOpacity(0.4)),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 5,
                                  decoration: BoxDecoration(
                                      color: Colors.pinkAccent.shade100),
                                ),
                                SW.medium(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const LabelText(
                                      text: "Cooking",
                                      isBold: true,
                                    ),
                                    SH.small(),
                                    Row(
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.only(
                                                top: 3,
                                                bottom: 3,
                                                left: 5,
                                                right: 5),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors
                                                        .pinkAccent.shade100,
                                                    width: 2),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(5)),
                                                color:
                                                    Colors.pinkAccent.shade100),
                                            child: DescriptionText(
                                              text: 'Everyday',
                                              isBold: true,
                                              isColor: true,
                                              color: color.backgroundColor,
                                            )),
                                        SW.small(),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              top: 3,
                                              bottom: 3,
                                              left: 5,
                                              right: 5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5)),
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: Colors
                                                      .pinkAccent.shade100,
                                                  width: 2)),
                                          child: Row(
                                            children: [
                                              DescriptionText(
                                                text: '2',
                                                isColor: true,
                                                color:
                                                    Colors.pinkAccent.shade100,
                                              ),
                                              // Text(
                                              //   "2",
                                              //   style: TextStyle(
                                              //       color: Colors
                                              //           .pinkAccent.shade100,
                                              //       fontSize: 12,
                                              //       fontWeight: FontWeight.w500),
                                              // ),
                                              Icon(
                                                Icons.flag_outlined,
                                                color:
                                                    Colors.pinkAccent.shade100,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color:
                                    Colors.pinkAccent.shade100.withOpacity(.3),
                              ),
                              child: Icon(
                                Icons.brush,
                                size: 23,
                                color: Colors.pinkAccent.shade100,
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 90,
                        //   width: MediaQuery.of(context).size.width,
                        //   child: ListView.separated(
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: 7,
                        //     itemBuilder: (context, index) {
                        //       return Container(
                        //         height: 40,
                        //         width: 40,
                        //         decoration: BoxDecoration(
                        //             shape: BoxShape.circle,
                        //             color: color.dialogBackgroundColor),
                        //       );
                        //     },
                        //     separatorBuilder: (context, index) => SW.small(),
                        //   ),
                        // )
                        SH.large(),
                        Row(
                          children: [
                            const DateChip(
                              day: 'Sun',
                              date: '1',
                              isColor: true,
                              selectColor: Colors.red,
                            ),
                            SW.small(),
                            const DateChip(
                              day: 'Mon',
                              date: '2',
                              isColor: true,
                              selectColor: Colors.red,
                            ),
                            SW.small(),
                            const DateChip(
                              day: 'Tue',
                              date: '3',
                              isColor: true,
                              selectColor: Colors.yellow,
                            ),
                            SW.small(),
                            const DateChip(day: 'Wed', date: '4'),
                            SW.small(),
                            const DateChip(day: 'Thu', date: '5'),
                            SW.small(),
                            const DateChip(
                              day: 'Fri',
                              date: '6',
                              isColor: true,
                              selectColor: Colors.red,
                            ),
                            // Expanded(
                            //   child: Container(
                            //     height: 41,
                            //     width: 41,
                            //     decoration: BoxDecoration(
                            //         shape: BoxShape.circle,
                            //         color: color.dialogBackgroundColor,
                            //         border:
                            //             Border.all(color: Colors.red, width: 2)
                            //             ),
                            //     child: Center(
                            //       child: Column(
                            //           mainAxisAlignment: MainAxisAlignment.center,
                            //           children: [
                            //         SH.small(),
                            //             const DesText(
                            //           text: "FRI",
                            //           isWhite: true,
                            //         ),
                            //         // SH.medium(),
                            //             const DesText(
                            //           text: "6",
                            //           isWhite: true,
                            //         )
                            //       ]),
                            //     ),
                            //   ),
                            // ),
                            SW.small(),
                            const DateChip(
                              day: 'Sat',
                              date: '7',
                              isColor: true,
                              selectColor: Colors.green,
                            ),
                            // SW.small(),
                          ],
                        ),
                        SH.large(),
                        Divider(
                          height: 2,
                          thickness: 2,
                          color: color.backgroundColor,
                        ),
                        SH.large(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.insert_link_rounded,
                                  color: Colors.pinkAccent.shade100,
                                  size: 25,
                                ),
                                SW.small(),
                                DescriptionText(
                                  isBold: true,
                                  text: "4",
                                  isColor: true,
                                  color: color.canvasColor,
                                ),
                                SW.medium(),
                                Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.pinkAccent.shade100,
                                  size: 25,
                                ),
                                SW.small(),
                                DescriptionText(
                                  isBold: true,
                                  text: "52%",
                                  isColor: true,
                                  color: color.canvasColor,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: color.disabledColor,
                                  size: 25,
                                ),
                                SW.medium(),
                                Icon(
                                  Icons.stacked_bar_chart,
                                  color: color.disabledColor,
                                  size: 25,
                                ),
                                SW.medium(),
                                Icon(
                                  Icons.more_vert,
                                  color: color.disabledColor,
                                  size: 25,
                                ),
                              ],
                            )
                          ],
                        )
                      ]),
                    ),
                  )
                ]),
              );
            },
            itemCount: 2,
            separatorBuilder: (context, index) => SH.large(),
          ),
        ),
      ),
    );
  }
}
