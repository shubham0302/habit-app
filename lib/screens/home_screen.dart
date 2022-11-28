import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/title_text.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime _selectedDate = DateTime.now();
    ThemeData color = Theme.of(context);
    return Scaffold(

        // drawer: Drawer(
        //   backgroundColor: color.backgroundColor,
        //   child: Column(
        //     children: [Text("fsdfg")],
        //   ),
        // ),
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(children: [
          SH.large(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // Scaffold.of(context).openDrawer();
                      },
                      child: Icon(
                        Icons.format_list_bulleted_outlined,
                        color: Colors.black,
                      ),
                    ),
                    SW.small(),
                    TitleText(text: _selectedDate.toString())
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.search),
                    SW.small(),
                    const Icon(Icons.calendar_month_outlined)
                  ],
                )
              ],
            ),
          ),
          SH.medium(),
          Container(
            // color: Color.fromARGB(255, 146, 212, 243),
            child: DatePicker(
              DateTime.now(),
              height: 80,
              width: 60,
              daysCount: 150,
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.blue,
              selectedTextColor: Colors.white,
              dateTextStyle: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              monthTextStyle: GoogleFonts.lato(
                  textStyle: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              )),
              onDateChange: (date) {
                _selectedDate = date;
              },
            ),
          )
        ]),
      ),
    ));
  }
}
