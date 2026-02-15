import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class CustomHomeCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final double? progress;
  final String subtitle;
  final bool isPercentIndicator;
  final double width;
  final double height;
  final Widget numberLabel;

  const CustomHomeCard({
    super.key,
    this.height = 24,
    this.width = 24,
    required this.iconPath,
    required this.title,
    this.progress,
    required this.subtitle,
    required this.numberLabel,
    this.isPercentIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.c283140.withValues(alpha: 0.5),
              AppColors.c283140.withValues(alpha: 0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border.all(color: AppColors.cFFFFFF.withValues(alpha: 0.2)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.5.h, horizontal: 8.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                iconPath,
                height: height.h,
                width: width.w,
              ),
              UIHelper.verticalSpace(8.h),
              numberLabel,
              UIHelper.verticalSpace(8.h),
              if (isPercentIndicator)
                Container(
                  height: 8.h,
                  width: 84.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.c3856E8.withValues(alpha: 0.1),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double progress = 0.2;
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 8.h,
                          width: constraints.maxWidth * progress,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20),
                            ),
                            color: AppColors.c3856E8,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              UIHelper.verticalSpace(8.h),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle14cFCD34DInter500.copyWith(
                  color: AppColors.cFCD34D.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
