import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/category_controller.dart';
import 'package:habbit_app/screens/categories/custom_dialog_categories.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController =
        Get.put(CategoryController(), permanent: false);
    ThemeData color = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const HeadingText(text: "Default Categories"),
          SH.small(),
          const DescriptionText(text: "Editable for premium users"),
          SH.large(),
          // SH.large(),
          SizedBox(
            height: 120,
            child: Obx(
              () => ListView.separated(
                separatorBuilder: (context, index) => SW.medium(),
                scrollDirection: Axis.horizontal,
                itemCount: categoryController.categories
                    .where((p0) => p0.isDefault)
                    .length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: color.disabledColor.withOpacity(0.2)),
                        child: Icon(
                          categoryController.icon[categoryController.categories
                              .where((p0) => p0.isDefault)
                              .toList()[index]
                              .icon],
                          color: categoryController.iconColor[categoryController
                              .categories
                              .where((p0) => p0.isDefault)
                              .toList()[index]
                              .color],
                          size: 40,
                        ),
                      ),
                      SH.small(),
                      DescriptionText(
                        isColor: true,
                        color: color.canvasColor,
                        isBold: true,
                        text: categoryController.categories
                            .where((p0) => p0.isDefault)
                            .toList()[index]
                            .name,
                        isWhite: true,
                      ),
                      const DescriptionText(text: "0 entries"),
                    ],
                  );
                },
              ),
            ),
          ),
          // Row(
          //   children: [
          //     Column(
          //       children: [
          //         Container(
          //           height: 60,
          //           width: 60,
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(8),
          //               color: color.disabledColor.withOpacity(0.2)),
          //           child: Icon(
          //             Icons.remove_circle_outline_rounded,
          //             color: color.focusColor,
          //             size: 40,
          //           ),
          //         ),
          //         SH.small(),

          //         DescriptionText(
          //           isColor: true,
          //           color: color.canvasColor,
          //           isBold: true,
          //           text: "Quit a habit",
          //           isWhite: true,
          //         ),
          //         const DescriptionText(text: "0 entries"),
          //         SH.large(),
          //         SH.large(),
          //       ],
          //     ),
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HeadingText(text: "Custom Categories"),
              GestureDetector(
                onTap: () {
                  categoryController.category.value = '';
                  categoryController.colorIndex.value = 0;
                  categoryController.iconType.value = 0;
                  categoryController.ctrl.text = '';
                  CategoriesCustomDialogBox(context, false);
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: color.disabledColor.withOpacity(0.2)),
                  child: Icon(
                    Icons.add,
                    color: color.disabledColor,
                    size: 23,
                  ),
                ),
              ),
            ],
          ),
          SH.small(),
          const DescriptionText(text: "4 Available"),
          // SH.large(),
          SH.large(),
          SizedBox(
            height: 150,
            child: Obx(
              () => ListView.separated(
                separatorBuilder: (context, index) => SW.medium(),
                physics: const BouncingScrollPhysics(),
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categoryController.categories
                    .where((p0) => !p0.isDefault)
                    .length,
                itemBuilder: (context, index) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GestureDetector(
                          onTap: () {
                            categoryController.colorIndex.value =
                                categoryController.categories
                                    .where((p0) => !p0.isDefault)
                                    .toList()[index]
                                    .color;
                            categoryController.iconType.value =
                                categoryController.categories
                                    .where((p0) => !p0.isDefault)
                                    .toList()[index]
                                    .icon;
                            categoryController.category.value =
                                categoryController.categories
                                    .where((p0) => !p0.isDefault)
                                    .toList()[index]
                                    .name;
                            categoryController.selectedId.value =
                                categoryController.categories
                                    .where((p0) => !p0.isDefault)
                                    .toList()[index]
                                    .id;
                            categoryController.ctrl.text = categoryController
                                .categories
                                .where((p0) => !p0.isDefault)
                                .toList()[index]
                                .name;
                            CategoriesCustomDialogBox(context, true);
                          },
                          onLongPress: () {
                            HapticFeedback.vibrate();
                            categoryController.shakeIndex.value = index + 1;
                            categoryController.removeIndex.value = index + 1;
                          },
                          onLongPressEnd: (e) {
                            categoryController.shakeIndex.value = 0;
                            // categoryController.removeIndex.value = index + 1;
                          },
                          behavior: HitTestBehavior.translucent,
                          child: Obx(
                            () => ShakeWidget(
                              autoPlay: categoryController.shakeIndex.value ==
                                  index + 1,
                              duration: const Duration(seconds: 1),
                              shakeConstant: ShakeChunkConstant(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: color.disabledColor
                                            .withOpacity(0.2)),
                                    child: Icon(
                                      categoryController.icon[categoryController
                                          .categories
                                          .where((p0) => !p0.isDefault)
                                          .toList()[index]
                                          .icon],
                                      color: categoryController.iconColor[
                                          categoryController.categories
                                              .where((p0) => !p0.isDefault)
                                              .toList()[index]
                                              .color],
                                      size: 40,
                                    ),
                                  ),
                                  SH.small(),
                                  DescriptionText(
                                    isColor: true,
                                    color: color.canvasColor,
                                    isBold: true,
                                    text: categoryController.categories
                                        .where((p0) => !p0.isDefault)
                                        .toList()[index]
                                        .name,
                                    isWhite: true,
                                  ),
                                  const DescriptionText(text: "0 entries"),
                                  SH.large(),
                                  SH.large(),
                                ],
                              ),
                            ),
                          )),
                      Obx(() =>
                          categoryController.removeIndex.value == index + 1
                              ? Positioned(
                                  top: 0,
                                  right: -8,
                                  child: GestureDetector(
                                    onTap: () {
                                      categoryController.deleteCategory(
                                          categoryController.categories
                                              .where((p0) => !p0.isDefault)
                                              .toList()[index]
                                              .id);
                                      categoryController.removeIndex.value = 0;
                                    },
                                    behavior: HitTestBehavior.translucent,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        // borderRadius: BorderRadius.circular(radius),
                                        color: color.primaryColor,
                                      ),
                                      child: Icon(Icons.remove,
                                          color: color.backgroundColor),
                                    ),
                                  ))
                              : const SizedBox())
                    ],
                  );
                },
              ),
            ),
          ),
          // Row(
          //   children: [
          //     GestureDetector(
          //       onTap: () {
          //         categoryController.getCategory();
          //       },
          //       child: Column(
          //         children: [
          //           Container(
          //             height: 60,
          //             width: 60,
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(8),
          //                 color: color.disabledColor.withOpacity(0.2)),
          //             child: Icon(
          //               Icons.sports_bar,
          //               color: color.highlightColor,
          //               size: 40,
          //             ),
          //           ),
          //           SH.small(),
          //           DescriptionText(
          //             isColor: true,
          //             color: color.canvasColor,
          //             isBold: true,
          //             text: "Exercise",
          //             isWhite: true,
          //           ),
          //           const DescriptionText(text: "0 entries"),
          //           SH.large(),
          //           SH.large(),
          //         ],
          //       ),
          //     ),
          //     SW.large(),
          //     GestureDetector(
          //       onTap: () {
          //         categoryController.category.value = '';
          //         categoryController.colorIndex.value = 0;
          //         categoryController.iconType.value = 0;
          //         categoryController.ctrl.text = '';
          //         CategoriesCustomDialogBox(context, false);
          //       },
          //       child: Column(
          //         children: [
          //           Container(
          //             height: 60,
          //             width: 60,
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(8),
          //                 color: color.disabledColor.withOpacity(0.2)),
          //             child: Icon(
          //               Icons.add,
          //               color: color.disabledColor,
          //               size: 40,
          //             ),
          //           ),
          //           SH.medium(),
          //           SH.small(),
          //           DescriptionText(
          //             isColor: true,
          //             color: color.canvasColor,
          //             isBold: true,
          //             text: "Add New",
          //             isWhite: true,
          //           ),
          //           // DescriptionText(text: "0 entries"),
          //           SH.large(),
          //           SH.large(),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ]),
      ),
    );
  }
}
