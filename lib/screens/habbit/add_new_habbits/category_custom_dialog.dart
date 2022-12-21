// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

void CategoryCustomDialogBox(BuildContext context) {
  AddHabbitSelectController addHabbitSelectController =
      Get.put(AddHabbitSelectController(), permanent: false);
  ThemeData color = Theme.of(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 2),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          backgroundColor: color.backgroundColor,
          content: Container(
            width: 360,
            height: 620,
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            String v = "Quit";
                            Icon iv = const Icon(
                              Icons.cancel_outlined,
                              color: Colors.red,
                            );
                            addHabbitSelectController.categoryIcon.value = iv;
                            addHabbitSelectController.updateCategory.value = v;
                            //
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.3))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(text: "Quit"),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: color.disabledColor
                                            .withOpacity(0.3)),
                                    child: const Icon(
                                      Icons.cancel_outlined,
                                      size: 30,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SW.medium(),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            String v = "Art";
                            Icon iv = const Icon(
                              Icons.brush,
                              color: Colors.red,
                            );
                            addHabbitSelectController.categoryIcon.value = iv;
                            addHabbitSelectController.updateCategory.value = v;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.3))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(text: "Art"),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: color.disabledColor
                                            .withOpacity(0.3)),
                                    child: const Icon(
                                      Icons.brush,
                                      size: 30,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SH.medium(),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            String v = "Meditation";
                            Icon iv = const Icon(
                              Icons.sports_gymnastics_sharp,
                              color: Colors.pink,
                            );
                            addHabbitSelectController.categoryIcon.value = iv;
                            addHabbitSelectController.updateCategory.value = v;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.3))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(text: "Meditation"),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: color.disabledColor
                                            .withOpacity(0.3)),
                                    child: const Icon(
                                      Icons.sports_gymnastics_sharp,
                                      size: 30,
                                      color: Colors.pink,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SW.medium(),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            String v = "Study";
                            Icon iv = const Icon(
                              Icons.cast_for_education,
                              color: Colors.purple,
                            );
                            addHabbitSelectController.categoryIcon.value = iv;
                            addHabbitSelectController.updateCategory.value = v;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.3))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(text: "Study"),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: color.disabledColor
                                            .withOpacity(0.3)),
                                    child: const Icon(
                                      Icons.cast_for_education,
                                      size: 30,
                                      color: Colors.purple,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SH.medium(),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            String v = "Sport";
                            Icon iv = Icon(
                              Icons.sports_baseball,
                              color: Colors.blue.shade600,
                            );
                            addHabbitSelectController.categoryIcon.value = iv;
                            addHabbitSelectController.updateCategory.value = v;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.3))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(text: "Sport"),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: color.disabledColor
                                            .withOpacity(0.3)),
                                    child: Icon(
                                      Icons.sports_baseball,
                                      size: 30,
                                      color: Colors.blue.shade600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SW.medium(),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            String v = "Entertaiment";
                            Icon iv = Icon(
                              Icons.movie,
                              color: Colors.blue.shade300,
                            );
                            addHabbitSelectController.categoryIcon.value = iv;
                            addHabbitSelectController.updateCategory.value = v;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.3))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(text: "Entertaiment"),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: color.disabledColor
                                            .withOpacity(0.3)),
                                    child: Icon(
                                      Icons.movie,
                                      size: 30,
                                      color: Colors.blue.shade300,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SH.medium(),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            String v = "Social";
                            Icon iv = const Icon(
                              Icons.chat,
                              // size: 30,
                              color: Colors.teal,
                            );
                            addHabbitSelectController.categoryIcon.value = iv;
                            addHabbitSelectController.updateCategory.value = v;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.3))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(text: "Social"),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: color.disabledColor
                                            .withOpacity(0.3)),
                                    child: const Icon(
                                      Icons.chat,
                                      size: 30,
                                      color: Colors.teal,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SW.medium(),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            String v = "Finance";
                            Icon iv = const Icon(
                              Icons.currency_rupee_outlined,
                              // size: 30,
                              color: Colors.green,
                            );
                            addHabbitSelectController.categoryIcon.value = iv;
                            addHabbitSelectController.updateCategory.value = v;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.3))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(text: "Finance"),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: color.disabledColor
                                            .withOpacity(0.3)),
                                    child: const Icon(
                                      Icons.currency_rupee_outlined,
                                      size: 30,
                                      color: Colors.green,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SH.medium(),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            String v = "Health";
                            Icon iv = const Icon(
                              Icons.health_and_safety,
                              // size: 30,
                              color: Colors.lightGreen,
                            );
                            addHabbitSelectController.categoryIcon.value = iv;
                            addHabbitSelectController.updateCategory.value = v;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.3))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(text: "Health"),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: color.disabledColor
                                            .withOpacity(0.3)),
                                    child: const Icon(
                                      Icons.health_and_safety,
                                      size: 30,
                                      color: Colors.lightGreen,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SW.medium(),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            String v = "Work";
                            Icon iv = Icon(
                              Icons.work,
                              // size: 30,
                              color: Colors.limeAccent.shade400,
                            );
                            addHabbitSelectController.categoryIcon.value = iv;
                            addHabbitSelectController.updateCategory.value = v;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.3))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(text: "Work"),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: color.disabledColor
                                            .withOpacity(0.3)),
                                    child: Icon(
                                      Icons.work,
                                      size: 30,
                                      color: Colors.limeAccent.shade400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SH.medium(),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            String v = "Nutriton";
                            Icon iv = const Icon(
                              Icons.restaurant_menu_outlined,
                              // size: 30,
                              color: Colors.orange,
                            );
                            addHabbitSelectController.categoryIcon.value = iv;
                            addHabbitSelectController.updateCategory.value = v;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.3))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(text: "Nutrition"),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: color.disabledColor
                                            .withOpacity(0.3)),
                                    child: const Icon(
                                      Icons.restaurant_menu_outlined,
                                      size: 30,
                                      color: Colors.orange,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SW.medium(),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            String v = "Home";
                            Icon iv = const Icon(
                              Icons.home,
                              // size: 30,
                              color: Colors.orangeAccent,
                            );
                            addHabbitSelectController.categoryIcon.value = iv;
                            addHabbitSelectController.updateCategory.value = v;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.3))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(text: "Home"),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: color.disabledColor
                                            .withOpacity(0.3)),
                                    child: const Icon(
                                      Icons.home,
                                      size: 30,
                                      color: Colors.orangeAccent,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SH.medium(),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            String v = "Outdoor";
                            Icon iv = const Icon(
                              Icons.landscape,
                              // size: 30,
                              color: Colors.deepOrange,
                            );
                            addHabbitSelectController.categoryIcon.value = iv;
                            addHabbitSelectController.updateCategory.value = v;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.3))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(text: "Outdoor"),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: color.disabledColor
                                            .withOpacity(0.3)),
                                    child: const Icon(
                                      Icons.landscape,
                                      size: 30,
                                      color: Colors.deepOrange,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SW.medium(),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            String v = "Other";
                            Icon iv = const Icon(
                              Icons.category_rounded,
                              // size: 30,
                              color: Colors.deepOrangeAccent,
                            );
                            addHabbitSelectController.categoryIcon.value = iv;
                            addHabbitSelectController.updateCategory.value = v;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.3))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(text: "Other"),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: color.disabledColor
                                            .withOpacity(0.3)),
                                    child: const Icon(
                                      Icons.category_rounded,
                                      size: 30,
                                      color: Colors.deepOrangeAccent,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SH.medium(),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            String v = "Quit";
                            Icon iv = const Icon(
                              Icons.cancel_outlined,
                              size: 30,
                              color: Colors.red,
                            );
                            addHabbitSelectController.categoryIcon.value = iv;
                            addHabbitSelectController.updateCategory.value = v;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.3))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(text: "Quit "),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: color.disabledColor
                                            .withOpacity(0.3)),
                                    child: const Icon(
                                      Icons.cancel_outlined,
                                      size: 30,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SW.medium(),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            String v = "Art";
                            Icon iv = const Icon(
                              Icons.brush,
                              // size: 30,
                              color: Colors.red,
                            );
                            addHabbitSelectController.categoryIcon.value = iv;
                            addHabbitSelectController.updateCategory.value = v;
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        color.disabledColor.withOpacity(0.3))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LabelText(text: "Art"),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: color.disabledColor
                                            .withOpacity(0.3)),
                                    child: const Icon(
                                      Icons.brush,
                                      size: 30,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SH.medium(),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  color: color.disabledColor.withOpacity(0.3)),
                              color: color.disabledColor.withOpacity(0.2)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const LabelText(text: "Greate"),
                                    SH.small(),
                                    const DescriptionText(text: "5 available")
                                  ],
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color:
                                          color.disabledColor.withOpacity(0.3)),
                                  child: Icon(
                                    Icons.add_box_outlined,
                                    size: 30,
                                    color: color.backgroundColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SW.medium(),
                      Expanded(
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              // borderRadius:
                              //     const BorderRadius.all(Radius.circular(10)),
                              // border: Border.all(
                              //     color: color.disabledColor.withOpacity(0.3))
                              ),
                        ),
                      ),
                    ],
                  )
                ]),
          ),
        );
      });
}
