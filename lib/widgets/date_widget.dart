import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';

import '../controllers/home_page_controller.dart';

class DateList extends StatelessWidget {
  final HomePageController controller =
      Get.put(HomePageController(), permanent: false);
  DateList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    return ListView.separated(
      separatorBuilder: (context, index) => SW.medium(),
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        return Obx(
          () => GestureDetector(
            onTap: () {
              controller.SelectedDateIndex.value = index;
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              decoration: BoxDecoration(
                  color: controller.SelectedDateIndex.value == index
                      ? color.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30)),
              // height: 50,
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 6, top: 10, right: 6, left: 6),
                child: Column(
                  children: [
                    SH.small(),
                    LabelText(
                      text: 'Thu',
                      isColor: true,
                      color: controller.SelectedDateIndex.value == index
                          ? color.backgroundColor
                          : color.disabledColor,
                    ),
                    SH.small(),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: color.backgroundColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: LabelText(
                        text: '24',
                        isColor: true,
                        color: color.primaryColor,
                        isBold: true,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}