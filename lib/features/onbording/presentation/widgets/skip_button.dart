import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';

Widget skipButton(Function()? onTap) {
  return InkWell(
    onTap: onTap,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    child: Container(
      height: 26.h,
      width: 57.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.c2E3642, borderRadius: BorderRadius.circular(20.r)),
      child: Text("Skip", style: TextFontStyle.textStyle12cFFFFFFInter400),
    ),
  );
}
