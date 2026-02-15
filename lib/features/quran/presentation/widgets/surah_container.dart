import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';

class SurahContainer extends StatelessWidget {
  final int surahNumber;
  final String title;
  final String subtitle;
  final String verses;
  final String type;
  final int progress;

  const SurahContainer({
    super.key,
    required this.surahNumber,
    required this.title,
    required this.subtitle,
    required this.verses,
    required this.type,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.navigateToWithArgs(Routes.surahScreen, {
          'surahNumber': surahNumber,
        });
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.0.sp),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 16.sp),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.c1B2638,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.c4B352C),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 52.h,
                              width: 52.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColors.cBC5A08,
                                border: Border.all(color: AppColors.cD08D06),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  surahNumber.toString(),
                                  style: TextFontStyle
                                      .textStyle16cEDE3BAInter700
                                      .copyWith(
                                    fontSize: 24,
                                    color: AppColors.c17202D,
                                  ),
                                ),
                              ),
                            ),
                            UIHelper.horizontalSpace(18.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: TextFontStyle
                                        .textStyle20cEDE3BAInter700,
                                  ),
                                  UIHelper.verticalSpace(4.h),
                                  Text(
                                    subtitle,
                                    style: TextFontStyle
                                        .textStyle12pxcAFA26BInter500,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              Assets.icons.quranMini.path,
                              height: 16.h,
                            ),
                            UIHelper.horizontalSpace(8.w),
                            Text(
                              verses,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextFontStyle.textStyle12pxcAFA26BInter500
                                  .copyWith(color: AppColors.cCFA128),
                            ),
                            UIHelper.horizontalSpace(4.w),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                ),
                                height: 28.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.c392C2E,
                                ),
                                child: Center(
                                  child: Text(
                                    type,
                                    style: TextFontStyle
                                        .textStyle12c00AF3AInter400
                                        .copyWith(color: AppColors.cD08D06),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    Assets.icons.quranBalack.path,
                    height: 70.h,
                    width: 70.w,
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Progress",
                        style: TextFontStyle.textStyle12c00AF3AInter400
                            .copyWith(color: AppColors.cCFA128),
                      ),
                      Text(
                        "$progress %",
                        style: TextFontStyle.textStyle12cFCD34DInter600,
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(4.h),
                  Container(
                    height: 8.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.c404A60,
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double progressValue = progress.toDouble() / 100;
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 8.h,
                            width: constraints.maxWidth * progressValue,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(20.r),
                              ),
                              color: AppColors.cB8B8B8,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
