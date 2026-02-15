import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';

class PremiumPopupUpgradeButton extends StatelessWidget {
  const PremiumPopupUpgradeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 295.w,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.cD87606, AppColors.cBC5A08],
          begin: AlignmentGeometry.centerLeft,
          end: AlignmentGeometry.centerRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "Upgrade to Premium - \$6.99/month",
          style: TextFontStyle.textStyle14c17202DInter600,
        ),
      ),
    );
  }
}
