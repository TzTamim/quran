import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class Subscription extends StatelessWidget {
  const Subscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: AppColors.c1B2638,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.c4B352C),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                Assets.icons.subscriptionIcon.path,
                height: 16.h,
                width: 16.w,
              ),
              UIHelper.horizontalSpace(8.w),
              Text(
                "Subscription",
                style: TextFontStyle.textStyle16cEDE3BAInter700,
              ),
            ],
          ),
          const Divider(color: AppColors.c4B352C),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Current Plan",
                style: TextFontStyle.textStyle16cFDE68AInter700,
              ),
              UIHelper.verticalSpace(8.h),
              Row(
                children: [
                  Text(
                    "Premium",
                    style: TextFontStyle.textStyle16cFDE68AInter700.copyWith(
                      color: AppColors.cEDE3BA,
                      fontSize: 20.sp,
                    ),
                  ),
                  UIHelper.horizontalSpace(153.w),
                  Image.asset(
                    Assets.icons.premiumIcon.path,
                    height: 25.h,
                    width: 32.w,
                  ),
                ],
              ),
              UIHelper.verticalSpace(8.h),
              Text(
                "Trial ends 22/11/2025",
                style: TextFontStyle.textStyle12pxcAFA26BInter500
                    .copyWith(color: AppColors.c997D2E),
              ),
              UIHelper.verticalSpace(16.h),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.cD87606,
                        AppColors.cBC5A08,
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.icons.document.path,
                        height: 20.h,
                        width: 20.w,
                      ),
                      UIHelper.horizontalSpace(8.w),
                      Expanded(
                        child: FittedBox(
                          child: Text(
                            "Upgrade to Premium - \$6.99/month",
                            style: TextFontStyle.textStyle16cC7394BInter700
                                .copyWith(
                              color: AppColors.c17202D,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              UIHelper.verticalSpace(4.h),
            ],
          ),
        ],
      ),
    );
  }
}
