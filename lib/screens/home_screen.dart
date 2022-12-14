import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:habbit_app/widgets/date_widget.dart';
import 'package:habbit_app/widgets/padding.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/title_text.dart';
import '../controllers/home_page_controller.dart';
import '../widgets/text_widget/main_label_text.dart';

class HomePage extends StatelessWidget {
  final HomePageController controller =
      Get.put(HomePageController(), permanent: false);
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find<ThemeController>();

    ThemeData color = Theme.of(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: color.primaryColor,
          child: const Icon(Icons.add),
        ),
        backgroundColor: color.backgroundColor,
        body: SafeArea(
          child: GlobalPadding(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // SH.med(),
              SH.large(),
              MainLabelText(
                text: 'Hello Meet,',
                isColor: true,
                color: color.disabledColor,
              ),

              SH.medium(),
              const MainLabelText(
                text: 'You have got no tasks on Dec 24',
              ),
              SH.large(),

              Container(
                  height: 75,
                  width: MediaQuery.of(context).size.width,
                  child: DateList()),
              SH.large(),
              const Divider(),
              SH.large(),

              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: color.disabledColor.withOpacity(.3)),
                child: GlobalPadding(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.greenAccent),
                            child: const Icon(
                              Icons.brush,
                              size: 40,
                            ),
                          ),
                          SW.medium(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color:
                                            Colors.greenAccent.withOpacity(.2)),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3, vertical: 1),
                                      child: LabelText(
                                        text: 'Habit',
                                        isColor: true,
                                        isBold: true,
                                        color: Colors.greenAccent,
                                      ),
                                    ),
                                  ),
                                  SW.small(),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.greenAccent)),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      child: LabelText(
                                        text: '2P',
                                        isColor: true,
                                        isBold: true,
                                        color: Colors.greenAccent,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SH.medium(),
                              const MainLabelText(text: 'Do homework')
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: color.backgroundColor),
                      )
                    ],
                  ),
                ),
              ),
              SH.large(),

              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: color.disabledColor.withOpacity(.3)),
                child: GlobalPadding(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.purpleAccent.shade100),
                            child: const Icon(
                              Icons.brush,
                              size: 40,
                            ),
                          ),
                          SW.medium(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: Colors.purpleAccent
                                            .withOpacity(.2)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3, vertical: 1),
                                      child: LabelText(
                                        text: 'Habit',
                                        isColor: true,
                                        isBold: true,
                                        color: Colors.purpleAccent.shade100,
                                      ),
                                    ),
                                  ),
                                  SW.small(),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(
                                            width: 1,
                                            color:
                                                Colors.purpleAccent.shade100)),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 2),
                                      child: LabelText(
                                        text: '2P',
                                        isColor: true,
                                        isBold: true,
                                        color: Colors.purpleAccent.shade100,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SH.medium(),
                              const MainLabelText(text: 'Grocery Shopping')
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: color.backgroundColor),
                      )
                    ],
                  ),
                ),
              ),
              SH.large(),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: color.disabledColor.withOpacity(.3)),
                child: GlobalPadding(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.pinkAccent.shade100),
                            child: const Icon(
                              Icons.brush,
                              size: 40,
                            ),
                          ),
                          SW.medium(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: Colors.pinkAccent.shade100
                                            .withOpacity(.2)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3, vertical: 1),
                                      child: LabelText(
                                        text: 'Habit',
                                        isColor: true,
                                        isBold: true,
                                        color: Colors.pinkAccent.shade100,
                                      ),
                                    ),
                                  ),
                                  SW.small(),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.pinkAccent.shade100)),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 2),
                                      child: LabelText(
                                        text: '2P',
                                        isColor: true,
                                        isBold: true,
                                        color: Colors.pinkAccent.shade100,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SH.medium(),
                              const MainLabelText(text: 'Gardening')
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: color.backgroundColor),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
