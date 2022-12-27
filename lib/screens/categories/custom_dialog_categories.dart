// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/category_controller.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

void CategoriesCustomDialogBox(BuildContext context) {
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
                    const InputField(hintText: "Ex. Travel"),
                    SH.large(),
                    const LabelText(text: "Category Color"),
                    SH.large(),
                    Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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

                    // Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    // Center(
                    //   child: InkWell(
                    //     borderRadius: BorderRadius.circular(50),
                    //     onTap: () {
                    //       // themeController.changeThemeColor('blue');
                    //       // print(Theme.of(context).brightness);
                    //       // Get.toNamed('/intro');
                    //     },
                    //     child: Container(
                    //       padding: const EdgeInsets.all(2),
                    //       height: 44,
                    //       width: 44,
                    //       decoration: BoxDecoration(
                    //           border: Border.all(
                    //               width: 2, color: color.canvasColor
                    //               // color: themeController.mode == 'blue'
                    //               //     ? (Theme.of(context).brightness ==
                    //               //             Brightness.light
                    //               //         ? ColorSchemeData.themeData[
                    //               //             'blue']!['primaryColor']
                    //               //         : ColorSchemeData.darkThemeData[
                    //               //             'blue']!['primaryColor'])!
                    //               //     : Colors.transparent,
                    //               ),
                    //           borderRadius: BorderRadius.circular(22)),
                    //       child: Container(
                    //         height: 40,
                    //         width: 40,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(25),
                    //             color: color.hoverColor
                    //             // color: Theme.of(context).brightness ==
                    //             //         Brightness.light
                    //             //     ? ColorSchemeData
                    //             //         .themeData['blue']!['primaryColor']
                    //             //     : ColorSchemeData.darkThemeData['blue']![
                    //             //         'primaryColor'],
                    //             ),
                    //         // child: Icon(Icons.arrow_forward_ios_rounded),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    //       Center(
                    //         child: InkWell(
                    //           borderRadius: BorderRadius.circular(50),
                    //           onTap: () {

                    //           },
                    //           child: Container(
                    //             padding: const EdgeInsets.all(2),
                    //             height: 44,
                    //             width: 44,
                    //             decoration: BoxDecoration(
                    //                 border: Border.all(
                    //                   width: 2,
                    //                   // color: themeController.mode == 'blue'
                    //                   //     ? (Theme.of(context).brightness ==
                    //                   //             Brightness.light
                    //                   //         ? ColorSchemeData.themeData[
                    //                   //             'blue']!['primaryColor']
                    //                   //         : ColorSchemeData.darkThemeData[
                    //                   //             'blue']!['primaryColor'])!
                    //                   //     : Colors.transparent,
                    //                 ),
                    //                 borderRadius: BorderRadius.circular(22)),
                    //             child: Container(
                    //               height: 40,
                    //               width: 40,
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(25),
                    //                   color: color.focusColor
                    //                   // color: Theme.of(context).brightness ==
                    //                   //         Brightness.light
                    //                   //     ? ColorSchemeData
                    //                   //         .themeData['blue']!['primaryColor']
                    //                   //     : ColorSchemeData.darkThemeData['blue']![
                    //                   //         'primaryColor'],
                    //                   ),
                    //               // child: Icon(Icons.arrow_forward_ios_rounded),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       Center(
                    //         child: InkWell(
                    //           borderRadius: BorderRadius.circular(50),
                    //           onTap: () {
                    //             // themeController.changeThemeColor('blue');
                    //             // print(Theme.of(context).brightness);
                    //             // Get.toNamed('/intro');
                    //           },
                    //           child: Container(
                    //             padding: const EdgeInsets.all(2),
                    //             height: 44,
                    //             width: 44,
                    //             decoration: BoxDecoration(
                    //                 border: Border.all(
                    //                   width: 2,
                    //                   // color: themeController.mode == 'blue'
                    //                   //     ? (Theme.of(context).brightness ==
                    //                   //             Brightness.light
                    //                   //         ? ColorSchemeData.themeData[
                    //                   //             'blue']!['primaryColor']
                    //                   //         : ColorSchemeData.darkThemeData[
                    //                   //             'blue']!['primaryColor'])!
                    //                   //     : Colors.transparent,
                    //                 ),
                    //                 borderRadius: BorderRadius.circular(22)),
                    //             child: Container(
                    //               height: 40,
                    //               width: 40,
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(25),
                    //                   color: color.highlightColor
                    //                   // color: Theme.of(context).brightness ==
                    //                   //         Brightness.light
                    //                   //     ? ColorSchemeData
                    //                   //         .themeData['blue']!['primaryColor']
                    //                   //     : ColorSchemeData.darkThemeData['blue']![
                    //                   //         'primaryColor'],
                    //                   ),
                    //               // child: Icon(Icons.arrow_forward_ios_rounded),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       Center(
                    //         child: InkWell(
                    //           borderRadius: BorderRadius.circular(50),
                    //           onTap: () {
                    //             // themeController.changeThemeColor('blue');
                    //             // print(Theme.of(context).brightness);
                    //             // Get.toNamed('/intro');
                    //           },
                    //           child: Container(
                    //             padding: const EdgeInsets.all(2),
                    //             height: 44,
                    //             width: 44,
                    //             decoration: BoxDecoration(
                    //                 border: Border.all(
                    //                   width: 2,
                    //                   // color: themeController.mode == 'blue'
                    //                   //     ? (Theme.of(context).brightness ==
                    //                   //             Brightness.light
                    //                   //         ? ColorSchemeData.themeData[
                    //                   //             'blue']!['primaryColor']
                    //                   //         : ColorSchemeData.darkThemeData[
                    //                   //             'blue']!['primaryColor'])!
                    //                   //     : Colors.transparent,
                    //                 ),
                    //                 borderRadius: BorderRadius.circular(22)),
                    //             child: Container(
                    //               height: 40,
                    //               width: 40,
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(25),
                    //                   color: color.disabledColor
                    //                   // color: Theme.of(context).brightness ==
                    //                   //         Brightness.light
                    //                   //     ? ColorSchemeData
                    //                   //         .themeData['blue']!['primaryColor']
                    //                   //     : ColorSchemeData.darkThemeData['blue']![
                    //                   //         'primaryColor'],
                    //                   ),
                    //               // child: Icon(Icons.arrow_forward_ios_rounded),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       Center(
                    //         child: InkWell(
                    //           borderRadius: BorderRadius.circular(50),
                    //           onTap: () {
                    //             // themeController.changeThemeColor('blue');
                    //             // print(Theme.of(context).brightness);
                    //             // Get.toNamed('/intro');
                    //           },
                    //           child: Container(
                    //             padding: const EdgeInsets.all(2),
                    //             height: 44,
                    //             width: 44,
                    //             decoration: BoxDecoration(
                    //                 border: Border.all(
                    //                     // width: 2, color: Colors.orange
                    //                     // color: themeController.mode == 'blue'
                    //                     //     ? (Theme.of(context).brightness ==
                    //                     //             Brightness.light
                    //                     //         ? ColorSchemeData.themeData[
                    //                     //             'blue']!['primaryColor']
                    //                     //         : ColorSchemeData.darkThemeData[
                    //                     //             'blue']!['primaryColor'])!
                    //                     //     : Colors.transparent,
                    //                     ),
                    //                 borderRadius: BorderRadius.circular(22)),
                    //             child: Container(
                    //               height: 40,
                    //               width: 40,
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(25),
                    //                   color: Colors.orange
                    //                   // color: Theme.of(context).brightness ==
                    //                   //         Brightness.light
                    //                   //     ? ColorSchemeData
                    //                   //         .themeData['blue']!['primaryColor']
                    //                   //     : ColorSchemeData.darkThemeData['blue']![
                    //                   //         'primaryColor'],
                    //                   ),
                    //               // child: Icon(Icons.arrow_forward_ios_rounded),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ]),
                    SH.large(),
                    const LabelText(text: "Category Iocn"),
                    SH.large(),
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5),
                        itemCount: categoryController.icon.length,
                        itemBuilder: (context, index) {
                          return Icon(
                            categoryController.icon[index],
                            color: color.disabledColor,
                            size: 35,
                          );
                        },
                      ),
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   child: Wrap(
                    //     // crossAxisAlignment: WrapCrossAlignment.start,
                    //     alignment: WrapAlignment.start,

                    //     // runAlignment: WrapAlignment.spaceBetween,
                    //     // crossAxisAlignment: WrapCrossAlignment.center,
                    //     children: [
                    //       // ...categoryController.icon.map(
                    //       //   (e) => Padding(
                    //       //     padding: const EdgeInsets.all(8.0),
                    //       //     child: Icon(
                    //       //       e,
                    //       //       color: color.disabledColor,
                    //       //       size: 35,
                    //       //     ),
                    //       //   ),
                    //       // )
                    //       // Icon(
                    //       //   Icons.business_center_rounded,
                    //       //   color: color.disabledColor,
                    //       //   size: 35,
                    //       // ),
                    //       // Icon(
                    //       //   Icons.health_and_safety_outlined,
                    //       //   color: color.disabledColor,
                    //       //   size: 35,
                    //       // ),
                    //       // Icon(
                    //       //   Icons.flight,
                    //       //   color: color.disabledColor,
                    //       //   size: 35,
                    //       // ),
                    //       // Icon(
                    //       //   Icons.movie_creation,
                    //       //   color: color.disabledColor,
                    //       //   size: 35,
                    //       // ),
                    //       // Icon(
                    //       //   Icons.monetization_on_outlined,
                    //       //   color: color.disabledColor,
                    //       //   size: 35,
                    //       // ),
                    //       // Icon(
                    //       //   Icons.home_filled,
                    //       //   color: color.disabledColor,
                    //       //   size: 35,
                    //       // ),
                    //       // Icon(
                    //       //   Icons.account_balance_rounded,
                    //       //   color: color.disabledColor,
                    //       //   size: 35,
                    //       // ),
                    //       // Icon(
                    //       //   Icons.task_outlined,
                    //       //   color: color.disabledColor,
                    //       //   size: 35,
                    //       // ),
                    //       // Icon(
                    //       //   Icons.baby_changing_station_rounded,
                    //       //   color: color.disabledColor,
                    //       //   size: 35,
                    //       // ),
                    //       // Icon(
                    //       //   Icons.food_bank_outlined,
                    //       //   color: color.disabledColor,
                    //       //   size: 35,
                    //       // ),
                    //     ],
                    //   ),
                    // ),
                    // SH.medium(),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Icon(
                    //       Icons.home_filled,
                    //       color: color.disabledColor,
                    //       size: 35,
                    //     ),
                    //     Icon(
                    //       Icons.account_balance_rounded,
                    //       color: color.disabledColor,
                    //       size: 35,
                    //     ),
                    //     Icon(
                    //       Icons.task_outlined,
                    //       color: color.disabledColor,
                    //       size: 35,
                    //     ),
                    //     Icon(
                    //       Icons.baby_changing_station_rounded,
                    //       color: color.disabledColor,
                    //       size: 35,
                    //     ),
                    //     Icon(
                    //       Icons.food_bank_outlined,
                    //       color: color.disabledColor,
                    //       size: 35,
                    //     )
                    //   ],
                    // )
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
