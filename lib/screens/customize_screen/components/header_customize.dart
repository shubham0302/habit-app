import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

class HeaderCustomize extends StatelessWidget {
  const HeaderCustomize({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalPadding(
      child: Row(
                children: [
                  GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (() {
                        Get.back();
                      }),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                      )),
                  SW.medium(),
                  const MainLabelText(text: 'Customize',isColor: true,),
                ],
              ),
    );
  }
}