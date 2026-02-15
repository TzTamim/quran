import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';
import 'premium_popup_upgrade_button.dart';

class CustomPremiumCardPopup {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          child: Container(
            width: 335.w,
            height: 625.h,
            decoration: BoxDecoration(
              color: AppColors.c1B2638,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.cCFA128, width: 1.sp),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
              child: Column(
                children: [
                 Image.asset( Assets.icons.lockColor.path,height: 60.h,width: 60.w,),
                  UIHelper.verticalSpace(12.h),
                  Text(
                    "Trial Ended",
                    style: TextFontStyle.textStyle32cFDE68AGeorgia700,
                  ),
                  UIHelper.verticalSpace(16.h),
                  Text(
                    "Your 7- day free trial has ended. Upgrade to Premium to continue your spiritual journey ",
                    style: TextFontStyle.textStyle14cAFA26BInter700,
                  ),
                  UIHelper.verticalSpace(32.h),
                  Container(
                    height: 270.h,
                    width: 288.w,
                    padding: EdgeInsets.all(16.sp),
                    decoration: BoxDecoration(
                      color: AppColors.cBC5A08.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.c4B352C, width: 1),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "What you’’ll get:",
                          style: TextFontStyle.textStyle16cFDE68AInter700,
                        ),
                        UIHelper.verticalSpace(18.h),
                        Row(
                          children: [
                         Image.asset( Assets.icons.mark.path,height: 16.h,width: 16.w,),
                            UIHelper.horizontalSpace(8.w),
                            Text(
                              "Unlimited daily activities",
                              style: TextFontStyle.textStyle14cCFA128Inter500,
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(14.h),
                        Row(
                          children: [
                                    Image.asset( Assets.icons.mark.path,height: 16.h,width: 16.w,),
                            UIHelper.horizontalSpace(8.w),
                            Text(
                              "Full Quran access (all 114 Surahs)",
                              style: TextFontStyle.textStyle14cCFA128Inter500,
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(14.h),
                        Row(
                          children: [
                                  Image.asset( Assets.icons.mark.path,height: 16.h,width: 16.w,),
                            UIHelper.horizontalSpace(8.w),
                            Text(
                              "Unlimited dhikr counting",
                              style: TextFontStyle.textStyle14cCFA128Inter500,
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(14.h),
                        Row(
                          children: [
                                    Image.asset( Assets.icons.mark.path,height: 16.h,width: 16.w,),
                            UIHelper.horizontalSpace(8.w),
                            Text(
                              "Unlimited journal entries",
                              style: TextFontStyle.textStyle14cCFA128Inter500,
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(14.h),
                        Row(
                          children: [
                                 Image.asset( Assets.icons.mark.path,height: 16.h,width: 16.w,),
                            UIHelper.horizontalSpace(8.w),
                            Text(
                              "Recovery analytics & tracking",
                              style: TextFontStyle.textStyle14cCFA128Inter500,
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(14.h),
                        Row(
                          children: [
                                    Image.asset( Assets.icons.mark.path,height: 16.h,width: 16.w,),
                            UIHelper.horizontalSpace(8.w),
                            Text(
                              "Achievement system",
                              style: TextFontStyle.textStyle14cCFA128Inter500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  UIHelper.verticalSpace(16.h),
                  const PremiumPopupUpgradeButton(),
                  UIHelper.verticalSpace(8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "A portion goes to Zakat & Charity",
                        style: TextFontStyle.textStyle14cBA9941Inter400,
                      ),
                      UIHelper.horizontalSpace(10.w),
                                Image.asset( Assets.icons.heartField.path,height: 16.h,width: 16.w,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// class CustomPremiumCardPopup extends StatelessWidget {
//   const CustomPremiumCardPopup({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 335.w,
//       height: 625.h,
//       decoration: BoxDecoration(
//         color: AppColors.c1B2638,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: AppColors.cCFA128, width: 1.sp),
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
//         child: Column(
//           children: [
//             SizedBox(height: 60.h, width: 60.w, child: Placeholder()),
//             UiHelper.verticalspace(12.h),
//             Text(
//               "Trial Ended",
//               style: TextFontStyle.titlestyle32cFDE68AGeorgia700,
//             ),
//             UiHelper.verticalspace(16.h),
//             Text(
//               "Your 7- day free trial has ended. Upgrade to Premium to continue your spiritual journey ",
//               style: TextFontStyle.titlestyle14cAFA26BInter700,
//             ),
//             UiHelper.verticalspace(32.h),
//             Container(
//               height: 282.h,
//               width: 288.w,
//               padding: EdgeInsets.all(16.sp),
//               decoration: BoxDecoration(
//                 color: AppColors.cBC5A08.withValues(alpha: 0.2),
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border.all(color: AppColors.c4B352C, width: 1),
//               ),
//               child: Column(
//                 children: [
//                   Text(
//                     "What you’’ll get:",
//                     style: TextFontStyle.titlestyle16cFDE68AInter700,
//                   ),
//                   UiHelper.verticalspace(12.h),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
