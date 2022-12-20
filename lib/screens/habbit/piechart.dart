// ignore_for_file: unnecessary_import, implementation_imports, depend_on_referenced_packages, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fl_chart/fl_chart.dart';

class PieCart extends StatelessWidget {
  const PieCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
    // return Container(child: PieChart(ctrl, context));
  }
}

List<PieChartSectionData> PieChart(ctrl, BuildContext context) {
  return List.generate(2, (index) {
    // final isTouched = index == touchedIndex;
    // final double opacity = isTouched ? 1 : 0.6;

    // Condition

    ThemeData color = Theme.of(context);
    switch (index) {
      case 0:
        return PieChartSectionData(
          color: color.primaryColor,
          // value: ctrl.taskCount.value.data!.pending!.toDouble(),
          value: ctrl.clientCount.value.data!.pie!.onboarded!.toDouble(),
          title: ctrl.clientCount.value.data!.pie!.onboarded.toString(),
          radius: 70,
          titleStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: color.primaryColor,
          ),
          titlePositionPercentageOffset: 0.5,
        );
      case 1:
        return PieChartSectionData(
          color: color.primaryColor,
          // value: ctrl.taskCount.value.data!.verify!.toDouble(),
          value: ctrl.clientCount.value.data!.pie!.inFollowup!.toDouble(),
          title: ctrl.clientCount.value.data!.pie!.inFollowup.toString(),
          radius: 60,
          titleStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color.primaryColor),
          titlePositionPercentageOffset: 0.5,
        );
      // case 2:
      //   return PieChartSectionData(
      //     color: ThemeConfig.primaryColor,
      //     value: ctrl.taskCount.value.data!.inProgress!.toDouble(),
      //     title: ctrl.taskCount.value.data!.inProgress!.toString(),
      //     radius: 30,
      //     titleStyle: TextStyle(
      //         fontSize: 12,
      //         fontWeight: FontWeight.bold,
      //         color: ThemeConfig.whiteColor),
      //     titlePositionPercentageOffset: 0.5,
      //   );
      // case 3:
      //   return PieChartSectionData(
      //     color: ThemeConfig.mainTextColor,
      //     value: ctrl.taskCount.value.data!.completed!.toDouble(),
      //     title: ctrl.taskCount.value.data!.completed!.toString(),
      //     radius: 30,
      //     titleStyle: TextStyle(
      //         fontSize: 12,
      //         fontWeight: FontWeight.bold,
      //         color: ThemeConfig.whiteColor),
      //     titlePositionPercentageOffset: 0.5,
      //   );

      default:
        return PieChartSectionData(
          color: color.primaryColor,
          value: 0,
          title: "yellow pie",
          radius: 30,
          titleStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          titlePositionPercentageOffset: 0.5,
        );
    }
  });
}
