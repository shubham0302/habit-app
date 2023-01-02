import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class CustomSnackbar {
  // final BuildContext context;

  // SnackBarController(this.context);

  void showTextSnackbar(context, String text) {
    ThemeData color = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        style: TextStyle(color: color.backgroundColor),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: color.primaryColor,
    ));
  }

  void showDefaultSuccessSnackbar(context) {
    ThemeData color = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Data Added Successfully',
        style: TextStyle(color: color.backgroundColor),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: color.primaryColor,
    ));
  }

  static showDefaultSuccessSnackbarStatic(context) {
    ThemeData color = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Data Added Successfully',
        style: TextStyle(color: color.backgroundColor),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: color.primaryColor,
    ));
  }

  void showDefaultErrorSnackbar(context) {
    ThemeData color = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Opps! Something went wrong',
        style: TextStyle(color: color.backgroundColor),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: color.primaryColor,
    ));
  }

  static errorSnackbar(context) {
    ThemeData color = Theme.of(context);
    return Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 2),
      icon: Icon(
        Icons.close,
        color: color.primaryColor,
      ),
      snackStyle: SnackStyle.GROUNDED,
      shouldIconPulse: true,
      messageText: Container(
        child: Text(
          "Error! Something went wrong",
          style: TextStyle(color: color.primaryColor),
        ),
      ),
    );
  }

  static errorSnackbar2(String text, context) {
    ThemeData color = Theme.of(context);
    return Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color.primaryColor,
      duration: const Duration(seconds: 2),
      icon: Icon(
        Icons.close,
        color: color.backgroundColor,
      ),
      snackStyle: SnackStyle.FLOATING,
      shouldIconPulse: true,
      messageText: Container(
        child: Text(
          text,
          style: TextStyle(color: color.backgroundColor),
        ),
      ),
    );
  }

  static SucessSnackbar(String text, context) {
    ThemeData color = Theme.of(context);
    return Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 2),
      icon: Icon(
        Icons.done,
        color: color.primaryColor,
      ),
      snackStyle: SnackStyle.GROUNDED,
      shouldIconPulse: true,
      messageText: Container(
        child: Text(
          text,
          style: TextStyle(color: color.primaryColor),
        ),
      ),
    );
  }

  static infoSnackbar(String text, context) {
    ThemeData color = Theme.of(context);
    return Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 2),
      icon: Icon(
        Icons.info,
        color: color.primaryColor,
      ),
      snackStyle: SnackStyle.GROUNDED,
      shouldIconPulse: true,
      messageText: Container(
        child: Text(
          text,
          style: TextStyle(color: color.primaryColor),
        ),
      ),
    );
  }

  static showDefaultErrorSnackbarStatic(context) {
    ThemeData color = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Opps! Something went wrong',
        style: TextStyle(color: color.backgroundColor),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: color.primaryColor,
    ));
  }
}

// void showDefaultErrorSnackbarStatic(context) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Row(
//         children: [
//           Icon(
//             Icons.check,
//             color: Colors.green,
//           ),
//           const Text(
//             'Sucess',
//             style: const TextStyle(color: Colors.green),
//           ),
//         ],
//       ),
//       behavior: SnackBarBehavior.floating,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
//       ),
//       backgroundColor: Colors.black,
//     ),
//   );
// }



// void showDefaultErrorSnackbar(context) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Row(
//         children: [
//           Icon(
//             Icons.close,
//             color: Colors.red,
//           ),
//           const Text(
//             'Error! Something went wrong',
//             style: const TextStyle(color: Colors.red),
//           ),
//         ],
//       ),
//       behavior: SnackBarBehavior.floating,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
//       ),
//       backgroundColor: Colors.black,
//     ),
//   );
// }
