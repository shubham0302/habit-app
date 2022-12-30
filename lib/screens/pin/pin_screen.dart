import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/lockpin_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_field/input_fields.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

class PinScreen extends StatelessWidget {
  const PinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData color = Theme.of(context);
    LockPinController lockPinController = Get.find<LockPinController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputField(
                  hintText: "Pin",
                  controller: lockPinController.pinCtrl,
                  isWhiteHintText: true,
                  textType: TextInputType.phone,
                  onChange: (p0) {
                    lockPinController.onSubmitverify(p0);
                    // lockPinController.pin.value = p0;
                  },
                ),
                SH.large(),
                SH.large(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      lockPinController.verify();
                      // if (lockPinController.setpin.value ==
                      //     lockPinController.pin.value) {
                      //   Get.toNamed('/intro');
                      // } else {
                      //   print('object');
                      // }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border:
                              Border.all(width: 2, color: color.primaryColor),
                          color: color.backgroundColor),
                      child: const Center(
                        child: MainLabelText(
                          text: "Enter",
                          isColor: true,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
