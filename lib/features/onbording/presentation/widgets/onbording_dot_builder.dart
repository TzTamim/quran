import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../gen/colors.gen.dart';
import '../../provider/onbording_provider.dart';

Widget onboringDotBuilder(BuildContext context) {
  final provider = context.watch<OnbordingProvider>();

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(3, (int index) {
      bool isActive = provider.currentIndex == index;

      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 8.w),
        decoration: BoxDecoration(
            color: isActive
                ? AppColors.cFCD34D
                : AppColors.cFCD34D.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(30.r)),
        width: isActive ? 40.w : 16.w,
        height: 6.h,
      );
    }),
  );
}
