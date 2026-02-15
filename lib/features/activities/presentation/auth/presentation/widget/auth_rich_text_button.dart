import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../../constants/text_font_style.dart';
import '../../../../../../gen/colors.gen.dart';

Widget authRichTextButton({
  required String text,
  required String buttonText,
  required Function onTap,
  TextStyle? butoonTextStyle,
  TextStyle? textstyle,
}) {
  return Text.rich(
    TextSpan(
      text: text,
      style: textstyle ?? TextFontStyle.textStyle12cFFFFFFInter400,
      children: [
        TextSpan(
          text: buttonText,
          style: butoonTextStyle ??
              TextFontStyle.textStyle12cFFFFFFInter400.copyWith(
                color: AppColors.cFFFFFF,
              ),
          recognizer: TapGestureRecognizer()..onTap = () => onTap(),
        ),
      ],
    ),
  );
}
