// ignore_for_file: unused_local_variable, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/app_labels/customize_screen.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

class CategoryIconStyle extends StatelessWidget {
  const CategoryIconStyle({super.key});

  @override
  Widget build(BuildContext context) {
    SwitchController switchController =
        Get.put(SwitchController(), permanent: false);
    ThemeController themeController = Get.find<ThemeController>();
    return GlobalPadding(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelText(text: CScreenLabels.categoryIconTitleText.tr),
            GlobalPadding(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    switchController.isClassic.value = true;
                    switchController.setIconTypeData();
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(10)),
                            height: 35,
                            width: 35,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          SW.small(),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            height: 35,
                            width: 35,
                            child: const Icon(
                              Icons.local_activity,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          SW.small(),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(10)),
                            height: 35,
                            width: 35,
                            child: const Icon(
                              Icons.bookmark_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                      SH.medium(),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: switchController.isClassic == true
                                ? Colors.purple.withOpacity(.2)
                                : Colors.transparent,
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 8),
                          // color: Colors.purple.withOpacity(.2),
                          child: DescriptionText(text: 'Classic'.tr))
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    switchController.isClassic.value = false;
                    switchController.setIconTypeData();
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.purple.withOpacity(.2),
                                borderRadius: BorderRadius.circular(10)),
                            height: 35,
                            width: 35,
                            child: const Icon(
                              Icons.add,
                              color: Colors.purple,
                              size: 28,
                            ),
                          ),
                          SW.small(),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.green.withOpacity(.2),
                                borderRadius: BorderRadius.circular(10)),
                            height: 35,
                            width: 35,
                            child: const Icon(
                              Icons.local_activity,
                              color: Colors.green,
                              size: 28,
                            ),
                          ),
                          SW.small(),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.lightBlue.withOpacity(.2),
                                borderRadius: BorderRadius.circular(10)),
                            height: 35,
                            width: 35,
                            child: const Icon(
                              Icons.bookmark_outlined,
                              color: Colors.lightBlue,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                      SH.medium(),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: switchController.isClassic == false
                                ? Colors.purple.withOpacity(.2)
                                : Colors.transparent,
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 8),
                          // color: Colors.purple.withOpacity(.2),
                          child: DescriptionText(text: 'Simple'.tr))
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
