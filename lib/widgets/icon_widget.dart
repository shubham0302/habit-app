// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/swich_controller.dart';

class IconWidgetClassic extends StatelessWidget {
  final IconData icon;
  // final double size;
  Color? contanerColor;
  Color? iconColor;
  double? contanerWidth;
  double? contanerHight;
  bool? contanerSize;
  double? iconSize;
  bool? iconSized;

  IconWidgetClassic(
      {Key? key,
      required this.icon,
      // required this.size,
      this.contanerColor,
      this.iconColor,
      this.contanerHight,
      this.contanerWidth,
      this.contanerSize,
      this.iconSize,
      this.iconSized})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SwitchController switchController = Get.put(SwitchController());
    return Obx(
      () => Container(
        height: contanerSize == true ? contanerHight : 35,
        width: contanerSize == true ? contanerWidth : 35,
        // elevation: 2.0,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: (switchController.isClassic.value == true
                ? contanerColor
                : contanerColor!.withOpacity(0.3))),
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Icon(
                    icon,
                    size: iconSized == true ? iconSize : 23,
                    color: switchController.isClassic.value == true
                        ? Colors.white
                        : contanerColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class IconWidgetSimple extends StatelessWidget {
//   final IconData icon;
//   // final double size;
//   Color? contanerColor;
//   Color? iconColor;
//   double? contanerWidth;
//   double? contanerHight;
//   bool? contanerSize;
//   double? iconSize;
//   bool? iconSized;

//   IconWidgetSimple(
//       {Key? key,
//       required this.icon,
//       // required this.size,
//       this.contanerColor,
//       this.iconColor,
//       this.contanerHight,
//       this.contanerWidth,
//       this.contanerSize,
//       this.iconSize,
//       this.iconSized})
//       : super(key: key);

//   @override
//   Widget build(
//     BuildContext context,
//   ) {
//     SwitchController switchController = Get.put(SwitchController());
//     return Container(
//       height: contanerSize == true ? contanerHight : 35,
//       width: contanerSize == true ? contanerWidth : 35,
//       // elevation: 2.0,
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(8)),
//         color: contanerColor!.withOpacity(0.3),
//       ),
//       padding: const EdgeInsets.all(5.0),
//       child: SizedBox(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child: FittedBox(
//                 fit: BoxFit.fill,
//                 child: Icon(
//                   icon,
//                   size: iconSized == true ? iconSize : 23,
//                   color: contanerColor,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
