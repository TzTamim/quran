import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../constants/text_font_style.dart';
import '../../../../../../gen/colors.gen.dart';

class BackToLoginButton extends StatelessWidget {
  const BackToLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 335.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.c767A84, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: SizedBox(
          height: 24.h,
          width: 99.w,
          child: Text(
            "Back to Login",
            style: TextFontStyle.textStyle16cFFFFFFInter500,
          ),
        ),
      ),
    );
  }
}
