import 'package:flutter/material.dart';

import '../theme_config.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final FocusNode? focusNode;

  final IconData tailingIcon;
  final IconData prefixIcon;

  final TextInputType? textType;
  final TextEditingController? controller;
  final Function? ontap;
  final bool? focus;
  final bool? obsecure;
  final Color? fillColor;
  final bool? isWhiteHintText;
  final bool? isDescription;
  final int? maxLenght;
  final Function? ontapSuffix;
  final Function? ontapPrefix;

  // ignore: prefer_typing_uninitialized_variables
  final labelText;
  final Function(String)? onChange;
  final Function(String)? onSubmit;

  const InputField({
    Key? key,
    required this.hintText,
    required this.tailingIcon,
    this.textType,
    this.controller,
    this.onChange,
    this.labelText,
    this.ontap,
    this.onSubmit,
    this.focus,
    this.focusNode,
    this.obsecure,
    this.fillColor,
    this.ontapSuffix,
    this.isWhiteHintText = false,
    this.isDescription = false,
    this.maxLenght,
    required this.prefixIcon,
    this.ontapPrefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: obsecure == true ? true : false,
        autofocus: focus == true ? true : false,
        onSubmitted: onSubmit,
        cursorColor: ThemeConfig.mainTextColor,
        // ignore: prefer_if_null_operators
        controller: controller != null ? controller : null,
        keyboardType: textType,
        onChanged: onChange,
        focusNode: focusNode,
        maxLength: maxLenght,
        maxLines: isDescription! ? 6 : 1,
        onTap: () {
          // ignore: avoid_print
          ontap != null ? ontap!() : print('');
        },
        decoration: InputDecoration(
          counterText: '',
          isDense: true,
          filled: true,
          fillColor: ThemeConfig.backgroundColor,
          contentPadding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
          hintText: hintText,
          labelText: labelText,
          hintStyle: const TextStyle(color: ThemeConfig.mainTextColor),
          prefixIcon: prefixIcon == Icons.abc
              ? null
              : GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Icon(
                    prefixIcon,
                    color: ThemeConfig.mainTextColor,
                    size: 23,
                  ),
                  onTap: () => ontapPrefix!(),
                ),
          suffixIcon: tailingIcon == Icons.abc
              ? null
              : GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Icon(
                    tailingIcon,
                    color: ThemeConfig.mainTextColor,
                    size: 23,
                  ),
                  onTap: () => ontapSuffix!(),
                ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ThemeConfig.radiusMin),
            borderSide: const BorderSide(color: Colors.grey, width: .1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ThemeConfig.radiusMin),
            borderSide: const BorderSide(color: Colors.grey, width: .1),
          ),
          border: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(ThemeConfig.radiusMin),
            borderSide:
                const BorderSide(color: ThemeConfig.whiteColor, width: 1),
          ),
        ));
  }
}
