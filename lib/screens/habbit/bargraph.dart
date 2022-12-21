// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:habbit_app/widgets/text_widget/des_text.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';

class BarGraph extends StatefulWidget {
  const BarGraph({super.key});

  // List<Color> get availableColors => const <Color>[
  //       Colors.purpleAccent,
  //       Colors.yellow,
  //       Colors.lightBlue,
  //       Colors.orange,
  //       Colors.pink,
  //       Colors.redAccent,
  //     ];

  @override
  State<StatefulWidget> createState() => BarGraphState();
}

class BarGraphState extends State<BarGraph> {
  // final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    return AspectRatio(
      aspectRatio: 1.5,
      child: Card(
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: color.backgroundColor,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: BarChart(
                          isPlaying ? randomData(color) : mainBarData(),
                          swapAnimationDuration: animDuration,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    var color = Theme.of(context);
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          toY: isTouched ? y + 1 : y,
          color: isTouched ? Colors.yellow : color.primaryColor,
          width: 50,
          borderSide: const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: Colors.transparent,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(4, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 25, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 50, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 100, isTouched: i == touchedIndex);

          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.blueGrey,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = 'Monday';
                break;
              case 1:
                weekDay = 'Tuesday';
                break;
              case 2:
                weekDay = 'Wednesday';
                break;
              case 3:
                weekDay = 'Thursday';
                break;

              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 44,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Container(
          width: 50,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            color: Colors.grey.withOpacity(.2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              DesText(text: 'This '),
              DesText(text: 'week'),
            ],
          ),
        );
        break;
      case 1:
        text = Container(
          width: 50,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            color: Colors.grey.withOpacity(.2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              DesText(text: 'This '),
              DesText(text: 'month'),
            ],
          ),
        );
        break;
      case 2:
        text = Container(
          width: 50,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            color: Colors.grey.withOpacity(.2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              DesText(text: 'This '),
              DesText(text: 'year'),
            ],
          ),
        );
        break;
      case 3:
        text = Container(
          width: 50,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            color: Colors.grey.withOpacity(.2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // SH.small(),
              DesText(text: 'All '),
              // DescriptionText(text: 'week'),
            ],
          ),
        );
        break;

      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: text,
    );
  }

  BarChartData randomData(ThemeData color) {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 44,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(4, (i) {
        switch (i) {
          case 0:
            return makeGroupData(
              0,
              Random().nextInt(15).toDouble() + 6,
              barColor: color.primaryColor,
            );
          case 1:
            return makeGroupData(
              1,
              Random().nextInt(15).toDouble() + 6,
              barColor: color.primaryColor,
            );
          case 2:
            return makeGroupData(
              2,
              Random().nextInt(15).toDouble() + 6,
              barColor: color.primaryColor,
            );
          case 3:
            return makeGroupData(
              3,
              Random().nextInt(15).toDouble() + 6,
              barColor: color.primaryColor,
            );

          default:
            return throw Error();
        }
      }),
      gridData: FlGridData(show: false),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}
