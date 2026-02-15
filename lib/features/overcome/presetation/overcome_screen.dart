import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';


import '../../../common_widgets/common_back_arrow.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';
import 'overcome_subtab_screen.dart';

class OvercomeScreen extends StatelessWidget {
  const OvercomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
          child: const CommonBackArrowWidget(),
        ),
        leadingWidth: 100.w,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding:
              EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
          child: Column(
            children: [
              UIHelper.verticalSpace(24.h),
              Container(
                padding: EdgeInsets.all(16.sp),
                height: 325.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.c1B2638,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.c4B352C),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      Assets.icons.privacyIconColorfull.path,
                      height: 60.h,
                      width: 60.w,
                    ),
                    UIHelper.verticalSpace(12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Text(
                        "Overcome & Find Peace",
                        style: TextFontStyle.textStyle32cF9BA2DGeorgia700,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    UIHelper.verticalSpace(16.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 27.w),
                      child: Text(
                        "Comprehensive support for your recovery journey",
                        style: TextFontStyle.textStyle16c798090Inter500
                            .copyWith(color: AppColors.cAFA26B),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    UIHelper.verticalSpace(12.h),
                    SizedBox(
                      height: 58.h,
                      width: 260.w,
                      child: Text(
                        "Indeed, Allah loves those who are\nconstantly\nrepentant\" - Quran 2:222",
                        style: TextFontStyle.textStyle14cCFA128Inter500
                            .copyWith(color: AppColors.cD08D06),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpace(16.h),
              Container(
                height: 340.h,
                width: double.infinity,
                padding: EdgeInsets.all(16.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.c1B2638,
                  border: Border.all(color: AppColors.c4B352C),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      Assets.icons.privacyIcon.path,
                      height: 60.h,
                      width: 60.w,
                    ),
                    UIHelper.verticalSpace(12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        "Begin Your Recovery Journey",
                        style: TextFontStyle.textStyle24cF9BA2DInter700
                            .copyWith(color: AppColors.cEDE3BA),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    UIHelper.verticalSpace(12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 11.w),
                      child: Text(
                        "Track your progress, identify triggers, develop coping strategies, and celebrate your victories. This is private and only visible to you.",
                        style:
                            TextFontStyle.textStyle16c798090Inter500.copyWith(
                          color: AppColors.cAFA26B,
                          fontSize: 14.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    UIHelper.verticalSpace(12.h),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const OvercomeSubtabScreen());
                      },
                      child: Container(
                        height: 44.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.cD87606, AppColors.cBC5A08],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              CupertinoIcons.heart,
                              color: AppColors.c17202D,
                            ),
                            UIHelper.horizontalSpace(10.w),
                            Text(
                              "Start Recovery Tracking",
                              style: TextFontStyle.textStyle16cEDE3BAInter700
                                  .copyWith(color: AppColors.c17202D),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpace(16.h),
              Container(
                height: 282.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 16.sp,
                  horizontal: 14.sp,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.c0A957B,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      Assets.icons.heartIcon.path,
                      height: 60.h,
                      width: 60.w,
                    ),
                    UIHelper.verticalSpace(12.h),
                    Text(
                      "You Are Not Alone",
                      style: TextFontStyle.textStyle24cF9BA2DInter700
                          .copyWith(color: AppColors.cFFFFFF),
                    ),
                    UIHelper.verticalSpace(12.h),
                    Text(
                      "Every day you resist is a victory. Every\nmoment of tawbah is accepted by Allah.\nHe is waiting for you with open arms of\nmercy.",
                      textAlign: TextAlign.center,
                      style: TextFontStyle.textStyle16c798090Inter500.copyWith(
                        color: AppColors.cFFFFFF,
                        fontSize: 14.sp,
                      ),
                    ),
                    UIHelper.verticalSpace(12.h),
                    SizedBox(
                      height: 42.h,
                      width: 275.w,
                      child: Text(
                        "Indeed, my Lord is near and responsive\"\nQuran 11:61",
                        textAlign: TextAlign.center,
                        style: TextFontStyle.textStyle14cFFFFFFInter500
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
