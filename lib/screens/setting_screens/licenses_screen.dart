// ignore_for_file: sized_box_for_whitespace, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/swich_controller.dart';
import 'package:habbit_app/widgets/sized_box.dart';
import 'package:habbit_app/widgets/text_widget/label_text.dart';
import 'package:habbit_app/widgets/text_widget/main_label_text.dart';

class LicScreen extends StatelessWidget {
  const LicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SwitchController switchController =
        Get.put(SwitchController(), permanent: false);
    // bool switchChange = true;
    ThemeData color = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (() {
                        Get.back();
                      }),
                      child: Container(
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: color.primaryColorLight,
                        ),
                      )),
                  SW.medium(),
                  const MainLabelText(
                    text: 'Licenses',
                  ),
                ],
              ),
              SH.large(),
              SH.medium(),
              const MainLabelText(
                text: "MPAndroidChart",
                isColor: true,
              ),
              SH.large(),
              const LabelText(
                text: "Copyright 2020 Philipp Jahoda.",
                isDotDot: false,
              ),
              SH.medium(),
              const LabelText(
                text:
                    'Licensed under the Apache License, Version 2.0 (the License); you may not use this file except in compliance with the License.You may obtain a copy of the License at http://www.apache .org/licenses/LICENSE-2.0\n\nUnless required by applicable law or agreed to in writing. software distributed under the License is distributed on an AS IS BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.',
              ),
              SH.large(),
              SH.medium(),
              const MainLabelText(
                text: "Konfetti",
                isColor: true,
              ),
              SH.large(),
              const LabelText(
                text:
                    "ISC License\n\nCopyright (c) 2017 Dion Segijn\n\nPermission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all copies. \n\nTHE SOFTWARE IS PROVIDED AS IS AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.",
              )
            ],
          ),
        ),
      )),
    );
  }
}
