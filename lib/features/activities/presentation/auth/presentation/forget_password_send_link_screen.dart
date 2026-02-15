import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common_widgets/common_back_arrow.dart';
import '../../../../../constants/text_font_style.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../helpers/ui_helpers.dart';
import 'widget/common_button.dart';


class ForgetPasswordSendlinkScreen extends StatelessWidget {
  const ForgetPasswordSendlinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: UIHelper.kDefaulutPadding(),
            left: UIHelper.kDefaulutPadding(),
            right: UIHelper.kDefaulutPadding(),
          ),
          child: Column(
            children: [
              UIHelper.verticalSpace(12.h),
              const CommonBackArrowWidget(),
              UIHelper.verticalSpace(175.h),
              Container(
                height: 288.w,
                width: 335.h,
                decoration: BoxDecoration(
                  color: AppColors.c283140,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 36.h,
                        width: 295.w,
                        child: Text(
                          "Check your email",
                          style: TextFontStyle.textStyle24cFFFFFFInter600,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 42.h,
                        width: 288.w,
                        child: Text(
                          "We've sent password reset instructions to your sk****@gmail.com",
                          style: TextFontStyle.textStyle14c979CA8Inter400,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      UIHelper.verticalSpace(24.h),
                      Container(
                        height: 65.h,
                        width: 295.w,
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: AppColors.c00AF3A.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.c00AF3A,
                            width: 0.5,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Please check your email for the password reset link. It may take a few minutes to arrive",
                            style: TextFontStyle.textStyle12c00AF3AInter400,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      UIHelper.verticalSpace(24.h),
                      CustomButton(
                        lable: 'Back to Sign In',
                        onTap: () {},
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
