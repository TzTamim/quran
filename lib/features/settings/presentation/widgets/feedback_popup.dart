import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widgets/custom_textfield.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class FeedbackPopup {
  static void show(BuildContext context) {
    final TextEditingController feedbackController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 288.h,
            width: 295.w,
            padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 20.sp),
            decoration: BoxDecoration(
              color: AppColors.c1B2638,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Send Feedback",
                  style: TextFontStyle.textStyle16cEDE3BAInter700.copyWith(
                    fontSize: 20.sp,
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Text(
                  "We love hearing from you! Share your\nthoughts, suggestions, or ideas.",
                  style: TextFontStyle.textStyle14cCFA128Inter500.copyWith(
                    color: AppColors.cAFA26B,
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                CustomTextField(
                  controller: feedbackController,
                  maxLines: 4,
                  height: 100.h,
                  hintText: "Your feedback means a lot to us...",
                  borderColor: AppColors.c4B352C,
                  textStyle: TextFontStyle.textStyle14cCFA128Inter500.copyWith(
                    color: AppColors.cEDE3BA,
                  ),
                  hintStyle: TextFontStyle.textStyle12c00AF3AInter400.copyWith(
                    color: AppColors.c5A6270,
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40.h,
                      width: 93.w,
                      decoration: BoxDecoration(
                        color: AppColors.c17202D,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.c4B352C),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Cancel",
                          style: TextFontStyle.textStyle14cAFA26BInter600
                              .copyWith(color: AppColors.cEDE3BA),
                        ),
                      ),
                    ),
                    UIHelper.horizontalSpace(12.w),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 150.w,
                        height: 40.h,
                        padding: EdgeInsets.symmetric(
                          vertical: 10.sp,
                          horizontal: 9.5.sp,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                            colors: [AppColors.c6A3E22, AppColors.c7A4E20],
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 16.h,
                              width: 15.5.w,
                              child: const Placeholder(),
                            ),
                            UIHelper.horizontalSpace(10.w),
                            Text(
                              "Send Feedback",
                              style: TextFontStyle.textStyle14c17202DInter600,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
