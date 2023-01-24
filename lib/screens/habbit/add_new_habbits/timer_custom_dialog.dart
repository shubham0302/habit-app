// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/screens/habbit/add_new_habbits/number_picker_custom_dailog.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void TimerCustomDialogBox(BuildContext context) {
  AddHabbitSelectController addHabbitSelectController =
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
                  insetPadding: const EdgeInsets.symmetric(horizontal: 2),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  backgroundColor: color.backgroundColor,
                  content: Container(
                    width: 280,
                    height: 220,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                              child: LabelText(
                            text: "Define your habit".tr,
                            isColor: true,
                            isBold: true,
                          )),
                          SH.medium(),
                          const Divider(
                            thickness: 1,
                          ),
                          SH.medium(),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            color: color.disabledColor)),
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: TimerDropDown(),
                                    ),
                                  ),
                                ),
                              ),
                              SW.medium(),
                            ],
                          ),
                          SH.large(),
                          Row(
                            children: [
                              Expanded(
                                  child: GestureDetector(
                                onTap: () {
                                  NumberPickerCustomDialogBox(context);
                                },
                                child: Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5, color: color.canvasColor),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Center(
                                    child: Obx(
                                      () => DescriptionText(
                                        text:
                                            "${addHabbitSelectController.currentvalueHour}:${addHabbitSelectController.currentvalueMin}:${addHabbitSelectController.currentvalueSec}",
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                              Expanded(
                                child: Container(
                                  height: 35,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DescriptionText(
                                      text: "a day".tr,
                                      isColor: true,
                                      color: color.canvasColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SH.medium(),
                          DescriptionText(
                              text:
                                  "e.g.. Meet with friend, at least 2 hours a day"
                                      .tr),
                          SH.large(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                  print(addHabbitSelectController
                                      .updateUnit.value);
                                  print(addHabbitSelectController
                                      .updateGoal.value);
                                },
                                child: MainLabelText(
                                  text: "Add".tr,
                                  isColor: true,
                                  isBold: true,
                                ),
                              ),
                              SW.large()
                            ],
                          )
                        ]),
                  ))),
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
  // builder: (BuildContext context) {
  //   return AlertDialog(
  //       insetPadding: const EdgeInsets.symmetric(horizontal: 2),
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //       backgroundColor: color.backgroundColor,
  //       content: Container(
  //         width: 280,
  //         height: 220,
  //         child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Center(
  //                   child: LabelText(
  //                 text: "Define your habit".tr,
  //                 isColor: true,
  //                 isBold: true,
  //               )),
  //               SH.medium(),
  //               const Divider(
  //                 thickness: 1,
  //               ),
  //               SH.medium(),
  //               Row(
  //                 children: [
  //                   Expanded(
  //                     child: GestureDetector(
  //                       onTap: () {},
  //                       child: Container(
  //                         height: 40,
  //                         decoration: BoxDecoration(
  //                             borderRadius: const BorderRadius.all(
  //                                 Radius.circular(10)),
  //                             border:
  //                                 Border.all(color: color.disabledColor)),
  //                         child: const Padding(
  //                           padding: EdgeInsets.only(left: 8.0, right: 8.0),
  //                           child: TimerDropDown(),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   SW.medium(),
  //                 ],
  //               ),
  //               SH.large(),
  //               Row(
  //                 children: [
  //                   Expanded(
  //                       child: GestureDetector(
  //                     onTap: () {
  //                       NumberPickerCustomDialogBox(context);
  //                     },
  //                     child: Container(
  //                       height: 35,
  //                       decoration: BoxDecoration(
  //                           border: Border.all(
  //                               width: 0.5, color: color.canvasColor),
  //                           borderRadius: const BorderRadius.all(
  //                               Radius.circular(10))),
  //                       child: Center(
  //                         child: Obx(
  //                           () => DescriptionText(
  //                             text:
  //                                 "${addHabbitSelectController.currentvalueHour}:${addHabbitSelectController.currentvalueMin}:${addHabbitSelectController.currentvalueSec}",
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   )),
  //                   Expanded(
  //                     child: Container(
  //                       height: 35,
  //                       child: Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: DescriptionText(
  //                           text: "a day".tr,
  //                           isColor: true,
  //                           color: color.canvasColor,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               SH.medium(),
  //               DescriptionText(
  //                   text: "e.g.. Meet with friend, at least 2 hours a day"
  //                       .tr),
  //               SH.large(),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   GestureDetector(
  //                     onTap: () {
  //                       Get.back();
  //                       print(addHabbitSelectController.updateUnit.value);
  //                       print(addHabbitSelectController.updateGoal.value);
  //                     },
  //                     child: MainLabelText(
  //                       text: "Add".tr,
  //                       isColor: true,
  //                       isBold: true,
  //                     ),
  //                   ),
  //                   SW.large()
  //                 ],
  //               )
  //             ]),
  //       ));
  // });
}

class TimerDropDown extends StatefulWidget {
  const TimerDropDown({Key? key}) : super(key: key);

  @override
  _TimerDropDownState createState() => _TimerDropDownState();
}

class _TimerDropDownState extends State<TimerDropDown> {
// Initial Selected Value
  String dropdownvalue = 'Item 1';

// List of items in our dropdown menu
  var items = [
    'At least'.tr,
    'Less than'.tr,
    'Any value'.tr,
  ];
  @override
  Widget build(BuildContext context) {
    AddHabbitSelectController addHabbitSelectController = Get.put(
      AddHabbitSelectController(),
    );
    ThemeData color = Theme.of(context);
    return DropdownButton(
      // Initial Value
      value: addHabbitSelectController.timerDropDownValue.value,
      dropdownColor: color.backgroundColor,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          addHabbitSelectController.timerDropDownValue.value = newValue!;
        });
      },
    );
  }
}
