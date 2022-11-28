import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/widgets/text_widget/heading_text.dart';
import 'package:habbit_app/widgets/text_widget/title_text.dart';

import '../controllers/home_page_controller.dart';
import '../widgets/bottomNavBar.dart';

class HomePage extends StatelessWidget {
   final HomePageController controller =
      Get.put(HomePageController(), permanent: false);
   HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(children: [
        Row(
          children: [],
        )
      ]),
    ),
            bottomNavigationBar: buildBottomNavigationMenu(context, 0, controller),

    
    );
  }
}
