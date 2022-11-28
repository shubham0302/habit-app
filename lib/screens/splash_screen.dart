import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/theme/theme_data.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Center(
          child: InkWell(
            onTap: () {
              Get.toNamed('/home');
            },
            child: Container(
              height: 50,
              width: 50,
              color: Theme.of(context).indicatorColor,
              child: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
        ),
      ),
    );
  }
}
