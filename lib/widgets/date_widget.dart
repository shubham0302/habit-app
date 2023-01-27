import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import '../controllers/home_page_controller.dart';

class DateList extends StatefulWidget {
  const DateList({Key? key}) : super(key: key);

  @override
  State<DateList> createState() => _DateListState();
}

class _DateListState extends State<DateList> {
  // var datenow = DateTime.now().day;
  final HomePageController controller =
      Get.put(HomePageController(), permanent: false);
  final AddHabbitSelectController controllerHabit =
      Get.put(AddHabbitSelectController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    return
        //  ListView.separated(
        //   separatorBuilder: (context, index) => SW.medium(),
        //   physics: const BouncingScrollPhysics(),
        //   shrinkWrap: true,
        //   scrollDirection: Axis.horizontal,
        //   itemCount: 30,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Row(
        //       children: [
        //         Obx(
        //           () => GestureDetector(
        //             onTap: () {
        //               controller.SelectedDateIndex.value = index;
        //             },
        //             behavior: HitTestBehavior.translucent,
        //             child: Container(
        //               decoration: BoxDecoration(
        //                   color: controller.SelectedDateIndex.value == index
        //                       ? color.primaryColor
        //                       : Colors.transparent,
        //                   borderRadius: BorderRadius.circular(30)),
        //               // height: 50,
        //               child: Padding(
        //                 padding: const EdgeInsets.only(
        //                     bottom: 6, top: 10, right: 6, left: 6),
        //                 child: Column(
        //                   children: [
        //                     SH.small(),
        //                     LabelText(
        //                       text: DateFormat('EEEE')
        //                           .format(DateTime(
        //                               DateTime.now().year,
        //                               DateTime.now().month,
        //                               DateTime.now().day + index
        //                               // DateTime.now()
        //                               //     .add(Duration(days: index))
        //                               //     .weekday

        //                               ))
        //                           .toString()
        //                           .substring(0, 3)
        //                           .toUpperCase(),
        //                       // '${}',
        //                       isColor: true,
        //                       color: controller.SelectedDateIndex.value == index
        //                           ? color.backgroundColor
        //                           : color.disabledColor,
        //                     ),
        //                     SH.small(),
        //                     Container(
        //                       alignment: Alignment.center,
        //                       height: 30,
        //                       width: 30,
        //                       decoration: BoxDecoration(
        //                           color: color.backgroundColor,
        //                           borderRadius: BorderRadius.circular(15)),
        //                       child: LabelText(
        //                         text:
        //                             '${DateTime.now().add(Duration(days: index)).day}',
        //                         isColor: true,
        //                         color: color.primaryColor,
        //                         isBold: true,
        //                       ),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     );
        //   },
        // );

        WeeklyDatePicker(
      enableWeeknumberText: false,
      weekdayTextColor: color.backgroundColor,
      selectedDigitColor: color.primaryColor,
      selectedBackgroundColor: color.backgroundColor,
      digitsColor: color.disabledColor,
      backgroundColor: color.backgroundColor,

      selectedDay: controller.selectedDay, // DateTime
      changeDay: (value) => setState(() {
        controller.selectedDay = value;
        // controllerHabit.selectedDay.value = value;
        controllerHabit.getTasks();
      }),
    );
  }
}
