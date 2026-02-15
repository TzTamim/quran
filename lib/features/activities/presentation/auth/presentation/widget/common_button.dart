import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../../constants/text_font_style.dart';
import '../../../../../../gen/colors.gen.dart';

class CustomButton extends StatelessWidget {
  final String lable;
  final Function()? onTap;
  const CustomButton({required this.onTap, super.key, required this.lable});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.h,
        width: 335.w,
        decoration: BoxDecoration(
          color: AppColors.cE16909,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          lable,
          textAlign: TextAlign.center,
          style: TextFontStyle.textStyle16cFFFFFFInter500,
        ),
      ),
    );
  }
}
