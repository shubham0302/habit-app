import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/descriptionText.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed('/habbit-detail');
              },
              child: Column(children: [
                Container(
                  height: 210,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                                  const MainLabelText(text: "Cooking"),
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
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5)),
                                              color:
                                                  Colors.pinkAccent.shade100),
                                          child: DescriptionText(
                                            text: 'Everyday',
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
                                                color:
                                                    Colors.pinkAccent.shade100,
                                                width: 2)),
                                        child: Row(
                                          children: [
                                            DescriptionText(
                                              text: '2',
                                              isColor: true,
                                              color: Colors.pinkAccent.shade100,
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
                                              color: Colors.pinkAccent.shade100,
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
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.pinkAccent.shade100,
                            ),
                            child: Icon(
                              Icons.brush,
                              size: 32,
                              color: color.backgroundColor,
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
                          Expanded(
                            child: Container(
                              height: 41,
                              width: 41,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: color.dialogBackgroundColor),
                              child: Center(
                                child: Column(children: [
                                  SH.small(),
                                  const DescriptionText(
                                    text: "SUN",
                                    isWhite: true,
                                  ),
                                  // SH.medium(),
                                  const DescriptionText(
                                    text: "1",
                                    isWhite: true,
                                  )
                                ]),
                              ),
                            ),
                          ),
                          SW.small(),
                          Expanded(
                            child: Container(
                              height: 41,
                              width: 41,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: color.dialogBackgroundColor),
                              child: Center(
                                child: Column(children: [
                                  SH.small(),
                                  const DescriptionText(
                                    text: "MON",
                                    isWhite: true,
                                  ),
                                  // SH.medium(),
                                  const DescriptionText(
                                    text: "2",
                                    isWhite: true,
                                  )
                                ]),
                              ),
                            ),
                          ),
                          SW.small(),
                          Expanded(
                            child: Container(
                              height: 41,
                              width: 41,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: color.dialogBackgroundColor,
                                  border: Border.all(
                                      color: Colors.green, width: 2)),
                              child: Center(
                                child: Column(children: [
                                  SH.small(),
                                  const DescriptionText(
                                    text: "TUS",
                                    isWhite: true,
                                  ),
                                  // SH.medium(),
                                  const DescriptionText(
                                    text: "3",
                                    isWhite: true,
                                  )
                                ]),
                              ),
                            ),
                          ),
                          SW.small(),
                          Expanded(
                            child: Container(
                              height: 41,
                              width: 41,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: color.dialogBackgroundColor,
                                  border: Border.all(
                                      color: Colors.yellow, width: 2)),
                              child: Center(
                                child: Column(children: [
                                  SH.small(),
                                  const DescriptionText(
                                    text: "WED",
                                    isWhite: true,
                                  ),
                                  // SH.medium(),
                                  const DescriptionText(
                                    text: "4",
                                    isWhite: true,
                                  )
                                ]),
                              ),
                            ),
                          ),
                          SW.small(),
                          Expanded(
                            child: Container(
                              height: 41,
                              width: 41,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: color.dialogBackgroundColor,
                                  border: Border.all(
                                      color: Colors.yellow, width: 2)),
                              child: Center(
                                child: Column(children: [
                                  SH.small(),
                                  const DescriptionText(
                                    text: "THU",
                                    isWhite: true,
                                  ),
                                  // SH.medium(),
                                  const DescriptionText(
                                    text: "5",
                                    isWhite: true,
                                  )
                                ]),
                              ),
                            ),
                          ),
                          SW.small(),
                          Expanded(
                            child: Container(
                              height: 41,
                              width: 41,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: color.dialogBackgroundColor,
                                  border:
                                      Border.all(color: Colors.red, width: 2)),
                              child: Center(
                                child: Column(children: [
                                  SH.small(),
                                  const DescriptionText(
                                    text: "FRI",
                                    isWhite: true,
                                  ),
                                  // SH.medium(),
                                  const DescriptionText(
                                    text: "6",
                                    isWhite: true,
                                  )
                                ]),
                              ),
                            ),
                          ),
                          SW.small(),
                          Expanded(
                            child: Container(
                              height: 41,
                              width: 41,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: color.dialogBackgroundColor,
                                  border: Border.all(
                                      color: Colors.green, width: 2)),
                              child: Center(
                                child: Column(children: [
                                  SH.small(),
                                  const DescriptionText(
                                    text: "SAT",
                                    isWhite: true,
                                  ),
                                  // SH.medium(),
                                  const DescriptionText(
                                    text: "7",
                                    isWhite: true,
                                  )
                                ]),
                              ),
                            ),
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
    );
  }
}
