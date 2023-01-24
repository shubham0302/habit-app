// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void DayOfMonthHabbit(BuildContext context) {
  AddHabbitSelectController addRecurringTaskController =
      Get.put(AddHabbitSelectController(), permanent: false);
  ThemeData color = Theme.of(context);

  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                backgroundColor: color.backgroundColor,
                content: SizedBox(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 7,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 15),
                            itemCount: 31,
                            itemBuilder: (context, index) {
                              return Obx(
                                () => GestureDetector(
                                    onTap: () {
                                      addRecurringTaskController.monthIndex
                                              .contains(index + 1)
                                          ? addRecurringTaskController
                                              .monthIndex
                                              .remove(index + 1)
                                          : addRecurringTaskController
                                              .monthIndex
                                              .add(index + 1);
                                      // addHabbitSelectController.categoryId.value =
                                      //     categoryController.categories[index].id;
                                    },
                                    behavior: HitTestBehavior.translucent,
                                    child: Container(
                                      // height: 70,
                                      padding: const EdgeInsets.all(8),
                                      alignment: Alignment.center,

                                      decoration: BoxDecoration(
                                          // borderRadius: BorderRadius.circular(1),
                                          shape: BoxShape.circle,
                                          color: addRecurringTaskController
                                                  .monthIndex
                                                  .contains(index + 1)
                                              ? color.primaryColor
                                              : color.disabledColor),
                                      // color: color.primaryColor,
                                      child: LabelText(
                                        text: "${index + 1}",
                                      ),
                                    )),
                              );
                            },
                          ),
                        ),
                      ),
                      // DescriptionText(text: 'Monday'),
                      // DescriptionText(text: 'Monday'),
                      // DescriptionText(text: 'Monday'),
                      // DescriptionText(text: 'Monday'),
                      // DescriptionText(text: 'Monday'),
                      // DescriptionText(text: 'Monday'),
                      // DescriptionText(text: 'Monday'),
                      // DescriptionText(text: 'Monday'),

                      // Column(mainAxisAlignment: MainAxisAlignment.start,
                      //     // crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       Row(
                      //         children: [
                      //           Expanded(
                      //             child: Row(
                      //               // crossAxisAlignment: CrossAxisAlignment.end,
                      //               children: [
                      //                 Checkbox(value: false, onChanged: (v) {

                      //                 }),
                      //                 DescriptionText(text: 'Monday')
                      //               ],
                      //             ),
                      //           ),
                      //           SW.medium(),
                      //           Expanded(
                      //             child: Row(
                      //               // crossAxisAlignment: CrossAxisAlignment.end,
                      //               children: [
                      //                 Checkbox(value: false, onChanged: (v) {}),
                      //                 DescriptionText(text: 'Tuesday')
                      //               ],
                      //             ),
                      //           ),
                      //           SW.small(),
                      //           Expanded(
                      //             child: Row(
                      //               // crossAxisAlignment: CrossAxisAlignment.end,
                      //               children: [
                      //                 Checkbox(value: false, onChanged: (v) {}),
                      //                 Expanded(
                      //                     child: DescriptionText(text: 'Wednesday'))
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       SH.small(),
                      //       Row(
                      //         children: [
                      //           Expanded(
                      //             child: Row(
                      //               // crossAxisAlignment: CrossAxisAlignment.end,
                      //               children: [
                      //                 Checkbox(value: false, onChanged: (v) {}),
                      //                 DescriptionText(text: 'Thursday')
                      //               ],
                      //             ),
                      //           ),
                      //           SW.small(),
                      //           Expanded(
                      //             child: Row(
                      //               // crossAxisAlignment: CrossAxisAlignment.end,
                      //               children: [
                      //                 Checkbox(value: false, onChanged: (v) {}),
                      //                 DescriptionText(text: 'Friday')
                      //               ],
                      //             ),
                      //           ),
                      //           SW.small(),
                      //           Expanded(
                      //             child: Row(
                      //               // crossAxisAlignment: CrossAxisAlignment.end,
                      //               children: [
                      //                 Checkbox(value: false, onChanged: (v) {}),
                      //                 DescriptionText(text: 'Saturday')
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       SH.small(),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: [
                      //           Row(
                      //             // crossAxisAlignment: CrossAxisAlignment.end,
                      //             children: [
                      //               Checkbox(value: false, onChanged: (v) {}),
                      //               DescriptionText(text: 'Sunday')
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //       SH.small(),
                      //     ]),

                      SH.large(),
                      const Divider(
                        thickness: 1,
                      ),
                      SH.medium(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: MainLabelText(
                              text: "ADD".tr,
                              isColor: true,
                              isBold: true,
                            ),
                          ),
                          SW.large()
                        ],
                      )
                    ],
                  ),
                ),
              )),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return SizedBox();
      });

  // showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //   return AlertDialog(
  //     insetPadding: const EdgeInsets.symmetric(horizontal: 20),
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //     backgroundColor: color.backgroundColor,
  //     content: SizedBox(
  //       height: 350,
  //       width: MediaQuery.of(context).size.width,
  //       child: Column(
  //         children: [
  //           Expanded(
  //             child: Center(
  //               child: GridView.builder(
  //                 physics: const NeverScrollableScrollPhysics(),
  //                 shrinkWrap: true,
  //                 gridDelegate:
  //                     const SliverGridDelegateWithFixedCrossAxisCount(
  //                         crossAxisCount: 7,
  //                         childAspectRatio: 1,
  //                         crossAxisSpacing: 10,
  //                         mainAxisSpacing: 15),
  //                 itemCount: 31,
  //                 itemBuilder: (context, index) {
  //                   return Obx(
  //                     () => GestureDetector(
  //                         onTap: () {
  //                           addRecurringTaskController.monthIndex
  //                                   .contains(index + 1)
  //                               ? addRecurringTaskController.monthIndex
  //                                   .remove(index + 1)
  //                               : addRecurringTaskController.monthIndex
  //                                   .add(index + 1);
  //                           // addHabbitSelectController.categoryId.value =
  //                           //     categoryController.categories[index].id;
  //                         },
  //                         behavior: HitTestBehavior.translucent,
  //                         child: Container(
  //                           // height: 70,
  //                           padding: const EdgeInsets.all(8),
  //                           alignment: Alignment.center,

  //                           decoration: BoxDecoration(
  //                               // borderRadius: BorderRadius.circular(1),
  //                               shape: BoxShape.circle,
  //                               color: addRecurringTaskController.monthIndex
  //                                       .contains(index + 1)
  //                                   ? color.primaryColor
  //                                   : color.disabledColor),
  //                           // color: color.primaryColor,
  //                           child: LabelText(
  //                             text: "${index + 1}",
  //                           ),
  //                         )),
  //                   );
  //                 },
  //               ),
  //             ),
  //           ),
  //           // DescriptionText(text: 'Monday'),
  //           // DescriptionText(text: 'Monday'),
  //           // DescriptionText(text: 'Monday'),
  //           // DescriptionText(text: 'Monday'),
  //           // DescriptionText(text: 'Monday'),
  //           // DescriptionText(text: 'Monday'),
  //           // DescriptionText(text: 'Monday'),
  //           // DescriptionText(text: 'Monday'),

  //           // Column(mainAxisAlignment: MainAxisAlignment.start,
  //           //     // crossAxisAlignment: CrossAxisAlignment.center,
  //           //     children: [
  //           //       Row(
  //           //         children: [
  //           //           Expanded(
  //           //             child: Row(
  //           //               // crossAxisAlignment: CrossAxisAlignment.end,
  //           //               children: [
  //           //                 Checkbox(value: false, onChanged: (v) {

  //           //                 }),
  //           //                 DescriptionText(text: 'Monday')
  //           //               ],
  //           //             ),
  //           //           ),
  //           //           SW.medium(),
  //           //           Expanded(
  //           //             child: Row(
  //           //               // crossAxisAlignment: CrossAxisAlignment.end,
  //           //               children: [
  //           //                 Checkbox(value: false, onChanged: (v) {}),
  //           //                 DescriptionText(text: 'Tuesday')
  //           //               ],
  //           //             ),
  //           //           ),
  //           //           SW.small(),
  //           //           Expanded(
  //           //             child: Row(
  //           //               // crossAxisAlignment: CrossAxisAlignment.end,
  //           //               children: [
  //           //                 Checkbox(value: false, onChanged: (v) {}),
  //           //                 Expanded(
  //           //                     child: DescriptionText(text: 'Wednesday'))
  //           //               ],
  //           //             ),
  //           //           ),
  //           //         ],
  //           //       ),
  //           //       SH.small(),
  //           //       Row(
  //           //         children: [
  //           //           Expanded(
  //           //             child: Row(
  //           //               // crossAxisAlignment: CrossAxisAlignment.end,
  //           //               children: [
  //           //                 Checkbox(value: false, onChanged: (v) {}),
  //           //                 DescriptionText(text: 'Thursday')
  //           //               ],
  //           //             ),
  //           //           ),
  //           //           SW.small(),
  //           //           Expanded(
  //           //             child: Row(
  //           //               // crossAxisAlignment: CrossAxisAlignment.end,
  //           //               children: [
  //           //                 Checkbox(value: false, onChanged: (v) {}),
  //           //                 DescriptionText(text: 'Friday')
  //           //               ],
  //           //             ),
  //           //           ),
  //           //           SW.small(),
  //           //           Expanded(
  //           //             child: Row(
  //           //               // crossAxisAlignment: CrossAxisAlignment.end,
  //           //               children: [
  //           //                 Checkbox(value: false, onChanged: (v) {}),
  //           //                 DescriptionText(text: 'Saturday')
  //           //               ],
  //           //             ),
  //           //           ),
  //           //         ],
  //           //       ),
  //           //       SH.small(),
  //           //       Row(
  //           //         mainAxisAlignment: MainAxisAlignment.start,
  //           //         children: [
  //           //           Row(
  //           //             // crossAxisAlignment: CrossAxisAlignment.end,
  //           //             children: [
  //           //               Checkbox(value: false, onChanged: (v) {}),
  //           //               DescriptionText(text: 'Sunday')
  //           //             ],
  //           //           ),
  //           //         ],
  //           //       ),
  //           //       SH.small(),
  //           //     ]),

  //           SH.large(),
  //           const Divider(
  //             thickness: 1,
  //           ),
  //           SH.medium(),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               GestureDetector(
  //                 onTap: () {
  //                   Get.back();
  //                 },
  //                 child: MainLabelText(
  //                   text: "ADD".tr,
  //                   isColor: true,
  //                   isBold: true,
  //                 ),
  //               ),
  //               SW.large()
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // });
}
