// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_print

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/description_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';
import 'package:lottie/lottie.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_files_and_screenshot_widgets_plus/share_files_and_screenshot_widgets_plus.dart';
import 'package:share_plus/share_plus.dart';

void HabbitCompleteTaskCustomDialogBox(
    BuildContext context, int index, ScreenshotController controller) {
  AddHabbitSelectController habbitSelectController =
      Get.put(AddHabbitSelectController(), permanent: false);
  ThemeData color = Theme.of(context);
  GlobalKey previewContainer = new GlobalKey();

  imageU8list() async {
    final image =
        // Image.asset('assets/images/badge.png');
        await controller
            .captureFromWidget(buildImage(controller, context, index));

    Uint8List list = image.buffer.asUint8List();
    ShareFilesAndScreenshotWidgets().shareFile(
        "Title", "Name.jpg", list, "image/jpg",
        text: "This is the caption!");
    print(image);
  }

  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                insetPadding: const EdgeInsets.symmetric(horizontal: 2),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                backgroundColor: color.backgroundColor,
                content: Container(
                  width: 250,
                  // height: 480,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: LabelText(
                            text: "Well Done!".tr,
                            isColor: true,
                          ),
                        ),
                        const Divider(),

                        // Container(
                        //   height: 150,
                        //   width: MediaQuery.of(context).size.width,
                        //   child: Lottie.asset('assets/lottie/complete.json',
                        //       fit: BoxFit.fill, repeat: false),
                        // ),
                        // MainLabelText(
                        //   text: habbitSelectController.tasks[index].habitName,
                        //   isColor: true,
                        // ),
                        // SH.large(),
                        // DescriptionText(text: 'New best streak'.tr),
                        // SH.small(),
                        // MainLabelText(
                        //   text: '1 Day'.tr,
                        //   isColor: true,
                        //   isBold: true,
                        // ),
                        RepaintBoundary(
                          key: previewContainer,
                          child: buildImage(
                              habbitSelectController, context, index),
                        ),
                        SH.medium(),
                        const Divider(),
                        SH.medium(),
                        DescriptionText(text: 'Next Award: 7 days'.tr),
                        SH.medium(),
                        const Divider(),
                        SH.medium(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.share,
                              color: color.primaryColor,
                            ),
                            SW.medium(),
                            GestureDetector(
                              onTap: () async {
                                ShareFilesAndScreenshotWidgets()
                                    .shareScreenshot(previewContainer, 1024, "",
                                        "Name.png", "image/png",
                                        text: "");
                                // final image =
                                //     // Image.asset('assets/images/badge.png');
                                //     await (controller.captureFromWidget(
                                //         buildImage(
                                //             controller, context, index)));
                                // print("path $image");
                                // int bytes = await image.elementSizeInBytes;
                                // await Share.shareXFiles(image);
                                imageU8list();
                              },
                              child: DescriptionText(
                                text: 'SHARE'.tr,
                                isColor: true,
                                isBold: true,
                              ),
                            ),
                          ],
                        ),
                        SH.medium(),
                        const Divider(),
                        SH.medium(),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: DescriptionText(text: 'CLOSE'.tr))
                      ]),
                ),
              ),
            ));
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return SizedBox();
      });

  // showDialog(
  //     context: context,
  //     builder: (BuildContext context) {

  //   return AlertDialog(
  //     insetPadding: const EdgeInsets.symmetric(horizontal: 2),
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //     backgroundColor: color.backgroundColor,
  //     content: Container(
  //       width: 250,
  //       // height: 480,
  //       child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Center(
  //               child: LabelText(
  //                 text: "Well Done!".tr,
  //                 isColor: true,
  //               ),
  //             ),
  //             const Divider(),
  //             Container(
  //               height: 150,
  //               width: MediaQuery.of(context).size.width,
  //               child: Lottie.asset('assets/lottie/complete.json',
  //                   fit: BoxFit.fill, repeat: false),
  //             ),
  //             MainLabelText(
  //               text: habbitSelectController.tasks[index].habitName,
  //               isColor: true,
  //             ),
  //             SH.large(),
  //             DescriptionText(text: 'New best streak'.tr),
  //             SH.small(),
  //             MainLabelText(
  //               text: '1 Day'.tr,
  //               isColor: true,
  //               isBold: true,
  //             ),
  //             SH.medium(),
  //             const Divider(),
  //             SH.medium(),
  //             DescriptionText(text: 'Next Award: 7 days'.tr),
  //             SH.medium(),
  //             const Divider(),
  //             SH.medium(),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Icon(
  //                   Icons.share,
  //                   color: color.primaryColor,
  //                 ),
  //                 SW.medium(),
  //                 DescriptionText(
  //                   text: 'SHARE'.tr,
  //                   isColor: true,
  //                   isBold: true,
  //                 ),
  //               ],
  //             ),
  //             SH.medium(),
  //             const Divider(),
  //             SH.medium(),
  //             GestureDetector(
  //                 onTap: () {
  //                   Get.back();
  //                 },
  //                 child: DescriptionText(text: 'CLOSE'.tr))
  //           ]),
  //     ),
  //   );
  // });
}

Widget buildImage(habbitSelectController, context, index) => Column(
      children: [
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: Lottie.asset('assets/lottie/complete.json',
              fit: BoxFit.fill, repeat: false),
        ),
        MainLabelText(
          text: habbitSelectController.tasks[index].habitName,
          isColor: true,
        ),
        SH.large(),
        DescriptionText(text: 'New best streak'.tr),
        SH.small(),
        MainLabelText(
          text: '1 Day'.tr,
          isColor: true,
          isBold: true,
        ),
      ],
    );
