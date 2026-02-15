import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../constants/text_font_style.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/colors.gen.dart';
import '../../../../../../helpers/ui_helpers.dart';
import 'common_back_arrow.dart';

class ResetPasswordSuccessfulScreen extends StatelessWidget {
  const ResetPasswordSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: UIHelper.kDefaulutPadding(),
            right: UIHelper.kDefaulutPadding(),
          ),
          child: Column(
            children: [
              const CommonBackArrowWidget(),
              UIHelper.verticalSpace(175.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.c283140,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.sp),
                  child: Column(
                    children: [
                      Image.asset(
                        Assets.icons.successIcon.path,
                        height: 40.h,
                        width: 40.w,
                      ),
                      UIHelper.verticalSpace(24.h),
                      Text(
                        "Successful",
                        style: TextFontStyle.textStyle24cFFFFFFInter600,
                        textAlign: TextAlign.center,
                      ),
                      UIHelper.verticalSpace(8.h),
                      Column(
                        children: [
                          Text(
                            "Your password has been reset.\n redirecting to login",
                            style: TextFontStyle.textStyle16c979CA8Inter600,
                            textAlign: TextAlign.center,
                          ),
                          UIHelper.verticalSpace(12.h),
                          Text(
                            "You can now sign in to Imam Flow with your new password",
                            style: TextFontStyle.textStyle14c979CA8Inter400,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
