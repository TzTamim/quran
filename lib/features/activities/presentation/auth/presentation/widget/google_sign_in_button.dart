import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../constants/text_font_style.dart';
import '../../../../../../gen/colors.gen.dart';


class SocialLoginButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final Function onTap;
  const SocialLoginButton({
    super.key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.50, color: AppColors.c798090),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              Image.asset(iconPath, width: 22.w, height: 22.h),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle16c798090Inter500,
              ),
            ],
          ),
        ));
  }
}
