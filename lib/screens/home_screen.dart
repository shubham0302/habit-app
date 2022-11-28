import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Center(
          child: InkWell(
              // onTap: () {
              //   Get.toNamed('page');
              // },
              // child: Container(
              //   height: 50,
              //   width: 50,
              //   color: Colors.amber,
              //   child: Icon(Icons.arrow_forward_ios_rounded),
              // ),
              ),
        ),
      ),
    );
  }
}
