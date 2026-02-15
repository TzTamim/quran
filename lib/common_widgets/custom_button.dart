import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';

class CommonButton extends StatelessWidget {
  final String lable;
  const CommonButton({super.key, required this.lable});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 48.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.cE16909,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            textAlign: TextAlign.center,
            lable,
            style: TextFontStyle.textStyle16cFFFFFFInter500,
          ),
        ),
      ),
    );
  }
}
