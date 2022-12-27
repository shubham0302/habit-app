import 'package:flutter/material.dart';
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
          SH.large(),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: color.disabledColor.withOpacity(0.2)),
                    child: Icon(
                      Icons.remove_circle_outline_rounded,
                      color: color.focusColor,
                      size: 40,
                    ),
                  ),
                  SH.small(),
                  DescriptionText(
                    isColor: true,
                    color: color.canvasColor,
                    isBold: true,
                    text: "Quit a habit",
                    isWhite: true,
                  ),
                  const DescriptionText(text: "0 entries"),
                  SH.large(),
                  SH.large(),
                ],
              ),
            ],
          ),
          const HeadingText(text: "Custom Categories"),
          SH.small(),
          const DescriptionText(text: "4 Available"),
          SH.large(),
          SH.large(),
          SizedBox(
            height: 150,
            child: Obx(
              () => ListView.separated(
                separatorBuilder: (context, index) => SW.medium(),
                physics: BouncingScrollPhysics(),
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categoryController.categories.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: color.disabledColor.withOpacity(0.2)),
                        child: Icon(
                          categoryController
                              .icon[categoryController.categories[index].icon],
                          color: categoryController.iconColor[
                              categoryController.categories[index].color],
                          size: 40,
                        ),
                      ),
                      SH.small(),
                      DescriptionText(
                        isColor: true,
                        color: color.canvasColor,
                        isBold: true,
                        text: categoryController.categories[index].name,
                        isWhite: true,
                      ),
                      const DescriptionText(text: "0 entries"),
                      SH.large(),
                      SH.large(),
                    ],
                  );
                },
              ),
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  categoryController.getCategory();
                },
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: color.disabledColor.withOpacity(0.2)),
                      child: Icon(
                        Icons.sports_bar,
                        color: color.highlightColor,
                        size: 40,
                      ),
                    ),
                    SH.small(),
                    DescriptionText(
                      isColor: true,
                      color: color.canvasColor,
                      isBold: true,
                      text: "Exercise",
                      isWhite: true,
                    ),
                    const DescriptionText(text: "0 entries"),
                    SH.large(),
                    SH.large(),
                  ],
                ),
              ),
              SW.large(),
              GestureDetector(
                onTap: () {
                  CategoriesCustomDialogBox(context);
                },
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: color.disabledColor.withOpacity(0.2)),
                      child: Icon(
                        Icons.add,
                        color: color.disabledColor,
                        size: 40,
                      ),
                    ),
                    SH.medium(),
                    SH.small(),
                    DescriptionText(
                      isColor: true,
                      color: color.canvasColor,
                      isBold: true,
                      text: "Add New",
                      isWhite: true,
                    ),
                    // DescriptionText(text: "0 entries"),
                    SH.large(),
                    SH.large(),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
