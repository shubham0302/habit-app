// ignore_for_file: sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/screens/habbit/Habbit_tabbar.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

class HabbitDetailScreen extends StatelessWidget {
  const HabbitDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              GlobalPadding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: (() {
                              Get.back();
                            }),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: color.primaryColor,
                            )),
                        SW.medium(),
                        const MainLabelText(text: 'Cooking'),
                      ],
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.purpleAccent.shade100),
                      child: Icon(
                        Icons.brush,
                        size: 20,
                        color: color.backgroundColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(child: HabbitTabbar())
            ],
          ),
        ),
      ),
    );
  }
}
