// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';
import 'package:numberpicker/numberpicker.dart';

void NumberPickerCustomDialogBox(BuildContext context) {
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        AddHabbitSelectController addHabbitSelectController =
            Get.put(AddHabbitSelectController(), permanent: false);
        return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 2),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: color.backgroundColor,
            content: Container(
              width: 300,
              height: 260,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                        child: LabelText(
                      text: "Enter Value",
                      isColor: true,
                      isBold: true,
                    )),
                    SH.medium(),
                    const Divider(
                      thickness: 1,
                    ),
                    SH.medium(),
                    _IntegerExample(),
                    SH.large(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              addHabbitSelectController.currentvalueSec.value =
                                  0;
                              addHabbitSelectController.currentvalueMin.value =
                                  0;
                              addHabbitSelectController.currentvalueHour.value =
                                  0;
                              Get.back();
                            },
                            child: const MainLabelText(text: "CLOSE")),
                        // Icon(
                        //   Icons.refresh,
                        //   size: 25,
                        //   color: color.canvasColor,
                        // ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const MainLabelText(
                            text: "OK",
                            isColor: true,
                          ),
                        )
                      ],
                    )
                  ]),
            ));
      });
}

class _IntegerExample extends StatefulWidget {
  @override
  __IntegerExampleState createState() => __IntegerExampleState();
}

class __IntegerExampleState extends State<_IntegerExample> {
  @override
  Widget build(BuildContext context) {
    ThemeData color = Theme.of(context);
    AddHabbitSelectController addHabbitSelectController =
        Get.put(AddHabbitSelectController(), permanent: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: <Widget>[
            NumberPicker(
              // itemCount: 12,
              infiniteLoop: true,
              value: addHabbitSelectController.currentvalueHour.value,
              minValue: 0,
              maxValue: 60,
              itemHeight: 40,
              textStyle: TextStyle(
                  color: color.primaryColor.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w200),
              selectedTextStyle: TextStyle(
                  color: color.primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w400),
              onChanged: (value) {
                setState(() {
                  addHabbitSelectController.currentvalueHour.value = value;
                });
                addHabbitSelectController.currentvalueHour.refresh();
              },
              // onChanged: (value) => setState(
              //     () => tabController.currentvalueSec.value = value),
            ),
            SH.large(),
            const DescriptionText(text: "hour")
          ],
        ),
        Column(
          children: <Widget>[
            NumberPicker(
              // itemCount: 12,
              infiniteLoop: true,
              value: addHabbitSelectController.currentvalueMin.value,
              minValue: 0,
              maxValue: 60,
              itemHeight: 40,
              textStyle: TextStyle(
                  color: color.primaryColor.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w200),
              selectedTextStyle: TextStyle(
                  color: color.primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w400),
              onChanged: (value) {
                setState(() {
                  addHabbitSelectController.currentvalueMin.value = value;
                });
              },
              // onChanged: (value) => setState(
              //     () => tabController.currentvalueSec.value = value),
            ),
            SH.large(),
            const DescriptionText(text: "minutes")
          ],
        ),
        Column(
          children: <Widget>[
            NumberPicker(
              // itemCount: 12,
              infiniteLoop: true,
              value: addHabbitSelectController.currentvalueSec.value,
              minValue: 0,
              maxValue: 60,
              itemHeight: 40,
              textStyle: TextStyle(
                  color: color.primaryColor.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w200),
              selectedTextStyle: TextStyle(
                  color: color.primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w400),
              onChanged: (value) {
                setState(() {
                  addHabbitSelectController.currentvalueSec.value = value;
                });
              },
              // onChanged: (value) => setState(
              //     () => tabController.currentvalueSec.value = value),
            ),
            SH.large(),
            const DescriptionText(text: "seconds")
          ],
        ),
      ],
    );
  }
}
