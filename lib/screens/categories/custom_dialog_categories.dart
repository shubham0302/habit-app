// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/category_controller.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void CategoriesCustomDialogBox(BuildContext context, bool fromUpdate) {
  CategoryController categoryController =
      Get.put(CategoryController(), permanent: false);
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return GlobalPadding(
          child: AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 2),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: color.backgroundColor,
            content: Wrap(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: MainLabelText(
                        text: "New Category",
                        isColor: true,
                      ),
                    ),
                    SH.large(),
                    const LabelText(text: "Category Name"),
                    SH.large(),
                    InputField(
                      hintText: "Ex. Travel",
                      controller: categoryController.ctrl,
                      onChange: (e) {
                        categoryController.category.value = e;
                      },
                    ),
                    SH.large(),
                    const LabelText(text: "Category Color"),
                    SH.large(),
                    Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5),
                        itemCount: categoryController.iconColor.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                categoryController.colorIndex.value = index;
                                // themeController.changeThemeColor('blue');
                                // print(Theme.of(context).brightness);
                                // Get.toNamed('/intro');
                              },
                              child: Obx(
                                () => Container(
                                  padding: const EdgeInsets.all(2),
                                  height: 44,
                                  width: 44,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: categoryController
                                                    .colorIndex.value ==
                                                index
                                            ? categoryController
                                                .iconColor[index]
                                            : Colors.transparent,
                                        // color: themeController.mode == 'blue'
                                        //     ? (Theme.of(context).brightness ==
                                        //             Brightness.light
                                        //         ? ColorSchemeData.themeData[
                                        //             'blue']!['primaryColor']
                                        //         : ColorSchemeData.darkThemeData[
                                        //             'blue']!['primaryColor'])!
                                        //     : Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(22)),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: categoryController
                                            .iconColor[index]),
                                    // child: Icon(Icons.arrow_forward_ios_rounded),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SH.large(),
                    const LabelText(text: "Category Icon"),
                    SH.large(),
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                crossAxisCount: 5),
                        itemCount: categoryController.icon.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              categoryController.iconType.value = index;
                            },
                            behavior: HitTestBehavior.translucent,
                            child: Obx(
                              () => Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2,
                                        color:
                                            categoryController.iconType.value ==
                                                    index
                                                ? categoryController.iconColor[
                                                    categoryController
                                                        .colorIndex.value]
                                                : Colors.transparent)),
                                // height: 30,
                                // width: 30,
                                // color: Colors.amber,
                                child: Icon(
                                  categoryController.icon[index],
                                  color: categoryController.iconType.value ==
                                          index
                                      ? categoryController.iconColor[
                                          categoryController.colorIndex.value]
                                      : color.disabledColor,
                                  size: 35,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SH.small(),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          if (fromUpdate) {
                            categoryController.updateCategory();
                          } else {
                            categoryController.addCategory();
                          }
                        },
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                              color: color.primaryColor.withOpacity(.2),
                              borderRadius: BorderRadius.circular(5)),
                          child: LabelText(
                            text: 'Create new Category'.toUpperCase(),
                            isColor: true,
                            color: color.primaryColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
