// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void NumericCustomDialogBox(BuildContext context) {
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
            child:  AlertDialog(
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
                    const Center(
                        child: LabelText(
                      text: "Define your habit",
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
                                  border:
                                      Border.all(color: color.disabledColor)),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: NumericDropDown(),
                                // child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     crossAxisAlignment:
                                //         CrossAxisAlignment.center,
                                //     children: [
                                //       DescriptionText(
                                //         text: "At least",
                                //         isColor: true,
                                //         color: color.canvasColor,
                                //       ),
                                //       Icon(
                                //         Icons.arrow_drop_down,
                                //         size: 20,
                                //         color: color.canvasColor,
                                //       )
                                //     ]),
                              ),
                            ),
                          ),
                        ),
                        SW.medium(),
                        Expanded(
                          child: InputField(
                            hintText: "Goal",
                            textType: TextInputType.number,
                            controller: addHabbitSelectController.goal,
                            isWhiteHintText: true,
                            onChange: (p4) {
                              addHabbitSelectController.updateGoal.value = p4;
                            },
                          ),
                        ),
                        SW.small(),
                      ],
                    ),
                    SH.large(),
                    Row(
                      children: [
                        Expanded(
                          child: InputField(
                            hintText: "Unit (optional)",
                            controller: addHabbitSelectController.unit,
                            isWhiteHintText: true,
                            onChange: (p1) {
                              addHabbitSelectController.updateUnit.value = p1;
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DescriptionText(
                                text: "a day",
                                isColor: true,
                                color: color.canvasColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SH.medium(),
                    const DescriptionText(
                        text: "e.g.. Meet with friend, at least 2 hours a day"),
                    SH.large(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                            print(addHabbitSelectController.updateUnit.value);
                            print(addHabbitSelectController.updateGoal.value);
                          },
                          child: const MainLabelText(
                            text: "Add",
                            isColor: true,
                            isBold: true,
                          ),
                        ),
                        SW.large()
                      ],
                    )
                  ]),
            ))
          ),
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
      //               const Center(
      //                   child: LabelText(
      //                 text: "Define your habit",
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
      //                           padding: EdgeInsets.only(left: 8, right: 8),
      //                           child: NumericDropDown(),
      //                           // child: Row(
      //                           //     mainAxisAlignment:
      //                           //         MainAxisAlignment.spaceBetween,
      //                           //     crossAxisAlignment:
      //                           //         CrossAxisAlignment.center,
      //                           //     children: [
      //                           //       DescriptionText(
      //                           //         text: "At least",
      //                           //         isColor: true,
      //                           //         color: color.canvasColor,
      //                           //       ),
      //                           //       Icon(
      //                           //         Icons.arrow_drop_down,
      //                           //         size: 20,
      //                           //         color: color.canvasColor,
      //                           //       )
      //                           //     ]),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                   SW.medium(),
      //                   Expanded(
      //                     child: InputField(
      //                       hintText: "Goal",
      //                       controller: addHabbitSelectController.goal,
      //                       isWhiteHintText: true,
      //                       onChange: (p4) {
      //                         addHabbitSelectController.updateGoal.value = p4;
      //                       },
      //                     ),
      //                   ),
      //                   SW.small(),
      //                 ],
      //               ),
      //               SH.large(),
      //               Row(
      //                 children: [
      //                   Expanded(
      //                     child: InputField(
      //                       hintText: "Unit (optional)",
      //                       controller: addHabbitSelectController.unit,
      //                       isWhiteHintText: true,
      //                       onChange: (p1) {
      //                         addHabbitSelectController.updateUnit.value = p1;
      //                       },
      //                     ),
      //                   ),
      //                   Expanded(
      //                     child: Container(
      //                       height: 35,
      //                       child: Padding(
      //                         padding: const EdgeInsets.all(8.0),
      //                         child: DescriptionText(
      //                           text: "a day",
      //                           isColor: true,
      //                           color: color.canvasColor,
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               SH.medium(),
      //               const DescriptionText(
      //                   text: "e.g.. Meet with friend, at least 2 hours a day"),
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
      //                     child: const MainLabelText(
      //                       text: "Add",
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

class NumericDropDown extends StatefulWidget {
  const NumericDropDown({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NumericDropDownState createState() => _NumericDropDownState();
}

class _NumericDropDownState extends State<NumericDropDown> {
// Initial Selected Value
  String dropdownvalue = 'Item 1';

// List of items in our dropdown menu
  var items = [
    'At least',
    'Less than',
    'Exactly',
    'Any value',
  ];
  @override
  Widget build(BuildContext context) {
    AddHabbitSelectController addHabbitSelectController = Get.put(
      AddHabbitSelectController(),
    );
    ThemeData color = Theme.of(context);
    return DropdownButton(
      // Initial Value
      value: addHabbitSelectController.numericDropDownValue.value,
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
          addHabbitSelectController.numericDropDownValue.value = newValue!;
        });
      },
    );
  }
}
