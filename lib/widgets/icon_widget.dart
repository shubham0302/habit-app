// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/constants/categories.dart';
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
    var color  = Theme.of(context);
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
                    size: iconSized == true ? iconSize : 10,
                    color: switchController.isClassic.value == true
                        ? color.backgroundColor
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



class IconWidget extends StatelessWidget {
  final int color;
  final int icon;
  final bool? isBig;
  const IconWidget({super.key, required this.color, required this.icon, this.isBig=false});

  @override
  Widget build(BuildContext context) {
    SwitchController switchController = Get.find<SwitchController>();
    var theme = Theme.of(context);
    return Obx(()=>Container(
      height: isBig==true? 60:30,
      width: isBig==true? 60:30,
      decoration: BoxDecoration(
          color: switchController.isClassic.value? theme.brightness==Brightness.dark? iconColor[color]:iconLightColor[color]:theme.dividerColor,
        borderRadius: BorderRadius.all(Radius.circular(isBig==true? 20:10)),
      ),
      child: Icon(iconData[icon],color:switchController.isClassic.value? theme.backgroundColor:iconColor[color],size: isBig==true? 40:20,),
    ),
    );
  }
}