import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class TasbihCounterContainer extends StatefulWidget {
  final Color color;
  final int counter;
  final Function(int counter) onTap;
  final String arabic;
  final String englishMeaning;
  const TasbihCounterContainer(
      {super.key,
      required this.color,
      required this.counter,
      required this.onTap,
      required this.arabic,
      required this.englishMeaning});

  @override
  State<TasbihCounterContainer> createState() => _TasbihCounterContainerState();
}

class _TasbihCounterContainerState extends State<TasbihCounterContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 539.h,
      width: 336.w,
      decoration: BoxDecoration(
        color: AppColors.c1B2638,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.c4B352C),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 16.sp),
            height: 94.h,
            child: Column(
              children: [
                Text(
                  widget.arabic,
                  style: TextFontStyle.textStyle24cFFFFFFInter600.copyWith(
                    fontSize: 32.sp,
                  ),
                ),
                UIHelper.horizontalSpace(8.h),
                Text(
                  widget.englishMeaning,
                  style: TextFontStyle.textStyle14cAFA26BInter600.copyWith(
                    color: AppColors.cC9AC47,
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: AppColors.c4B352C),
          SizedBox(
            // padding: EdgeInsets.fromLTRB(20.sp, 20.sp, 20.sp, 16.sp),
            height: 394.h,
            width: 296.w,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    widget.onTap(widget.counter);
                  },
                  child: Container(
                    height: 194.h,
                    width: 194.w,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(color: AppColors.cFDE68A),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        widget.counter.toString(),
                        style:
                            TextFontStyle.textStyle24cFFFFFFInter600.copyWith(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Row(
                  children: [
                    Text(
                      "Progress to goal(33)",
                      style: TextFontStyle.textStyle14cFCD34DInter500.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.cFDE68A,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "10%",
                      style: TextFontStyle.textStyle14cFCD34DInter500.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.cFDE68A,
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(12.h),
                Container(
                  height: 8.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.c283140,
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double progressValue = 10 / 100;
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 8.h,
                          width: constraints.maxWidth * progressValue,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20.r),
                            ),
                            color: AppColors.c078EB9,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                UIHelper.verticalSpace(12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 46.5.sp),
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.icons.mingcuteAiFill.path,
                        height: 16.h,
                        width: 16.w,
                      ),
                      UIHelper.horizontalSpace(4.w),
                      Text(
                        "Estimated rating gain: +5.0",
                        style:
                            TextFontStyle.textStyle14cFCD34DInter500.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.cFDE68A,
                        ),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Container(
                  height: 40.h,
                  width: 296.w,
                  decoration: BoxDecoration(
                    color: AppColors.c17202D,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.c4B352C, width: 0.4),
                  ),
                  child: Center(
                    child: Text(
                      "Reset \$ Save",
                      style: TextFontStyle.textStyle14cAFA26BInter700.copyWith(
                        color: AppColors.cFDE68A,
                      ),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Container(
                  height: 40.h,
                  width: 296.w,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.cD87606, AppColors.cBC5A08],
                    ),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.c4B352C, width: 0.4),
                  ),
                  child: Center(
                    child: Text(
                      "Goal: 33",
                      style: TextFontStyle.textStyle14cAFA26BInter700.copyWith(
                        color: AppColors.c17202D,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          UIHelper.verticalSpace(16.h),
        ],
      ),
    );
  }
}
