// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/recurring_controller.dart';
import 'package:habbit_app/controllers/category_controller.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/widgets/icon_widget.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void CategoryRecurringCustomDialogBox(BuildContext context) {
  SwitchController switchController =
      Get.put(SwitchController(), permanent: false);
  AddRecurringTaskController addHabbitSelectController =
      Get.put(AddRecurringTaskController(), permanent: false);
  CategoryController categoryController =
      Get.put(CategoryController(), permanent: false);
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 10),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          backgroundColor: color.backgroundColor,
          content: Container(
            width: 360,
            height: 620,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 2),
                    itemCount: categoryController.categories.length,
                    itemBuilder: (context, index) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              addHabbitSelectController.categoryId.value =
                                  categoryController.categories[index].id;
                              Get.back();
                            },
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: Border.all(
                                      color:
                                          color.primaryColor.withOpacity(0.3))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: LabelText(
                                          text: categoryController
                                              .categories[index].name),
                                    ),
                                    // Container(
                                    //   height: 30,
                                    //   width: 30,
                                    //   decoration: BoxDecoration(
                                    //       borderRadius: const BorderRadius.all(
                                    //         Radius.circular(10),
                                    //       ),
                                    //       color: categoryController.iconColor[
                                    //               categoryController
                                    //                   .categories[index].color]
                                    //           .withOpacity(0.3)),
                                    //   child: Icon(
                                    //     categoryController.icon[
                                    //         categoryController
                                    //             .categories[index].icon],
                                    //     size: 23,
                                    //     color: categoryController.iconColor[
                                    //         categoryController
                                    //             .categories[index].color],
                                    //   ),
                                    // ),
                                    Obx(() => IconWidgetClassic(
                                          contanerSize: true,
                                          contanerHight: 30,
                                          contanerWidth: 30,
                                          icon: categoryController.icon[
                                              categoryController
                                                  .categories[index].icon],
                                          contanerColor: color.brightness ==
                                                  Brightness.dark
                                              ? categoryController.iconColor[
                                                  categoryController
                                                      .categories[index].color]
                                              : categoryController
                                                      .iconLightColor[
                                                  categoryController
                                                      .categories[index].color],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
