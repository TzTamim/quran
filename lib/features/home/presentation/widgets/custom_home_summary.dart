import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';


class CustomHomeSummary extends StatelessWidget {
  const CustomHomeSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.cBC5A08.withValues(alpha: .2), width: 1),
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            AppColors.cBC5A08.withValues(alpha: 0.5),
            AppColors.cBC5A08.withValues(alpha: 0),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today's Summary",
                style: TextFontStyle.textStyle16cFFFFFFInter500,
              ),
              RichText(
                text: TextSpan(
                  text: '42',
                  style: TextFontStyle.textStyle16cFFFFFFInter600,
                  children: [
                    TextSpan(
                      text: '/',
                      style: TextFontStyle.textStyle16cFCD34DInter600,
                      children: [
                        TextSpan(
                          text: '99',
                          style: TextFontStyle.textStyle16cFCD34DInter600
                              .copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          UIHelper.verticalSpace(8.h),
          LinearProgressIndicator(
            value: 0.42,
            backgroundColor: AppColors.cFCD34D.withValues(alpha: 0.1),
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.cFCD34D),
            minHeight: 12.h,
            borderRadius: BorderRadius.circular(20),
          ),
          UIHelper.verticalSpace(8.h),
          Text(
            "Keep building your spriritual momentum",
            style: TextFontStyle.textStyle14cFCD34DInter400.copyWith(
              color: AppColors.cFCD34D.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
