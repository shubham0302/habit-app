// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/task_controller.dart';
import 'package:habbit_app/controllers/category_controller.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void CategoryTaskCustomDialogBox(BuildContext context) {
  AddTaskController addHabbitSelectController =
      Get.put(AddTaskController(), permanent: false);
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
                  // GridView.builder(
                  //   physics: NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 2, childAspectRatio: 2),
                  //   itemCount: categoryController.defaultString.length,
                  //   itemBuilder: (context, index) {
                  //     return Expanded(
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: GestureDetector(
                  //           onTap: () {
                  //             // String v = "Quit";
                  //             // Icon iv = const Icon(
                  //             //   Icons.cancel_outlined,
                  //             //   color: Colors.red,
                  //             // );

                  //             //
                  //             // addHabbitSelectController.categoryIcon.value =
                  //             // addHabbitSelectController.categoryIcon.value =
                  //             // addHabbitSelectController.categoryId.value =
                  //             //     categoryController.categories[index].id;
                  //             Get.back();
                  //           },
                  //           child: Container(
                  //             height: 60,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 borderRadius: const BorderRadius.all(
                  //                     Radius.circular(10)),
                  //                 border: Border.all(
                  //                     color: color.disabledColor
                  //                         .withOpacity(0.3))),
                  //             child: Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Row(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Expanded(
                  //                     child: LabelText(
                  //                         text: categoryController
                  //                             .defaultString[index]['name']),
                  //                   ),
                  //                   Container(
                  //                     height: 30,
                  //                     width: 30,
                  //                     decoration: BoxDecoration(
                  //                         borderRadius: const BorderRadius.all(
                  //                           Radius.circular(10),
                  //                         ),
                  //                         color: color.disabledColor
                  //                             .withOpacity(0.3)),
                  //                     child: Icon(
                  //                       categoryController.icon[
                  //                           categoryController
                  //                               .defaultString[index]['icon']],
                  //                       size: 20,
                  //                       color: categoryController.iconColor[
                  //                           categoryController
                  //                               .defaultString[index]['color']],
                  //                     ),
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
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
                              // String v = "Quit";
                              // Icon iv = const Icon(
                              //   Icons.cancel_outlined,
                              //   color: Colors.red,
                              // );

                              //
                              // addHabbitSelectController.categoryIcon.value =
                              // addHabbitSelectController.categoryIcon.value =
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
                                      color: color.disabledColor
                                          .withOpacity(0.3))),
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
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          color: color.disabledColor
                                              .withOpacity(0.3)),
                                      child: Icon(
                                        categoryController.icon[
                                            categoryController
                                                .categories[index].icon],
                                        size: 23,
                                        color: categoryController.iconColor[
                                            categoryController
                                                .categories[index].color],
                                      ),
                                    )
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
