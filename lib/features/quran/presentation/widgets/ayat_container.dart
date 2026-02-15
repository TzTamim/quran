import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class AyatContainer extends StatefulWidget {
  final int index;
  final String ayat;
  final String translation;
  final bool isRead;
  final VoidCallback onMarkRead;

  const AyatContainer({
    super.key,
    required this.index,
    required this.ayat,
    required this.translation,
    required this.isRead,
    required this.onMarkRead,
  });

  @override
  State<AyatContainer> createState() => _AyatContainerState();
}

class _AyatContainerState extends State<AyatContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.sp),
      padding: EdgeInsets.all(16.sp),
      height: 210.h,
      decoration: BoxDecoration(
        gradient: widget.isRead
            ? const LinearGradient(
                colors: [AppColors.c0E6C4A, AppColors.c152032])
            : const LinearGradient(
                colors: [AppColors.c1B2638, AppColors.c1B2638]),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  color: widget.isRead ? AppColors.c0A957B : AppColors.cBC5A08,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                        widget.isRead ? AppColors.c12AD90 : AppColors.cD08D06,
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.index.toString(),
                    style: TextFontStyle.textStyle20cEDE3BAInter700.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.c17202D,
                    ),
                  ),
                ),
              ),
              UIHelper.horizontalSpace(16.w),
              SizedBox(
                width: 196.w,
                height: 26.h,
                child: Text(
                  widget.ayat,
                  style: TextFontStyle.textStyle20cEDE3BAInter600,
                ),
              ),
            ],
          ),
          UIHelper.verticalSpace(34.h),
          SizedBox(
            height: 104.h,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 48.h,
                  width: 265.w,
                  child: Text(
                    widget.translation,
                    style: TextFontStyle.textStyle16cFCD34DInter600.copyWith(
                      color: AppColors.cAFA26B,
                    ),
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                widget.isRead
                    ? Center(
                        child: SizedBox(
                          height: 24.h,
                          width: 245.w,
                          child: Row(
                            children: [
                              Icon(Icons.check_circle_outline,
                                  size: 16.sp, color: AppColors.c22D3B2),
                              UIHelper.horizontalSpace(8.h),
                              Row(
                                children: [
                                  Text(
                                    "Read",
                                    style: TextFontStyle
                                        .textStyle14cCFA128Inter500
                                        .copyWith(color: AppColors.c22D3B2),
                                  ),
                                  UIHelper.horizontalSpace(8.w),
                                  Icon(Icons.check,
                                      size: 12.sp, color: AppColors.c22D3B2),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Image.asset(Assets.icons.star.path,
                                      height: 16.h, width: 16.w),
                                  UIHelper.horizontalSpace(4.w),
                                  Text(
                                    '+1',
                                    style: TextFontStyle
                                        .textStyle16cC7394BInter700
                                        .copyWith(color: AppColors.cFCD34D),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          widget.onMarkRead();
                        },
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.sp,
                              vertical: 8.sp,
                            ),
                            height: 40.h,
                            width: 218.w,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [AppColors.cD87606, AppColors.cBC5A08],
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.circle_outlined,
                                  size: 16.sp,
                                ),
                                UIHelper.horizontalSpace(10.w),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      'Mark as Read (+1 pt)',
                                      style: TextFontStyle
                                          .textStyle16cFCD34DInter600
                                          .copyWith(color: AppColors.c17202D),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
