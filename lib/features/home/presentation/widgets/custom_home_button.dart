import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/colors.gen.dart';
import '../../../../constants/text_font_style.dart';

class CustomHomeButton extends StatelessWidget {
  const CustomHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 32.w),
      decoration: BoxDecoration(
        color: AppColors.cBC5A08,
        borderRadius: BorderRadius.circular(8),
      ),
      child: FittedBox(
        child: Text(
          "Subscribe Now - \$6.99/month",
          style: TextFontStyle.textStyle14cFFFFFFInter400,
        ),
      ),
    );
  }
}
