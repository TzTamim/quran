import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';

class RewardsDialog extends StatefulWidget {
  final String title;
  final double rewards;
  final Color? color1;
  final Color? color2;

  const RewardsDialog({
    super.key,
    required this.title,
    required this.rewards,
    this.color1,
    this.color2,
  });

  @override
  State<RewardsDialog> createState() => _RewardsDialogState();
}

class _RewardsDialogState extends State<RewardsDialog> {
  late Timer _colorTimer;
  int _colorIndex = 0;

  // Use ValueNotifier for efficient color updates
  final ValueNotifier<List<Color>> _colorNotifier =
      ValueNotifier<List<Color>>([]);

  final List<List<Color>> _colors = [
    [AppColors.cE11E4A, AppColors.cC126CF],
    [AppColors.c05966A, AppColors.c0891B0],
    [AppColors.cE16909, AppColors.c978824],
  ];

  @override
  void initState() {
    super.initState();

    // Initialize current colors
    if (widget.color1 != null && widget.color2 != null) {
      _colorNotifier.value = [widget.color1!, widget.color2!];
    } else {
      _colorNotifier.value = _colors[_colorIndex];
      _startColorRotation();
    }
  }

  void _startColorRotation() {
    _colorTimer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if (_colorIndex < _colors.length - 1) {
        _colorIndex++;
        _colorNotifier.value = _colors[_colorIndex];
      } else {
        _colorIndex = 0;
        timer.cancel();
        NavigationService.goBack;
      }
    });
  }

  @override
  void dispose() {
    _colorTimer.cancel();
    _colorNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c582561,
      body: SafeArea(
        child: ValueListenableBuilder<List<Color>>(
          valueListenable: _colorNotifier,
          builder: (context, currentColors, child) {
            return Container(
              height: .9.sh,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: currentColors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(40)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 44.h, horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(height: 40.h, width: 40.w),
                    UIHelper.verticalSpace(12.h),
                    SizedBox(height: 31.h, width: 139.w),
                    UIHelper.verticalSpace(12.h),
                    SizedBox(
                      height: 42.h,
                      width: 282.w,
                      child: Text(
                        "Jazakallah Khair",
                        style: TextFontStyle.textStyle32cFFFFFFGeorgia700,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    UIHelper.verticalSpace(12.h),
                    SizedBox(
                      height: 46.h,
                      width: 261.w,
                      child: Text(
                        "May Allah grant you the best of this wprld and the hereafter",
                        style: TextFontStyle.textStyle18cFFFFFFSitka700,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    UIHelper.verticalSpace(40.h),
                    Container(
                      height: 125.h,
                      width: 213.w,
                      decoration: BoxDecoration(
                        color: AppColors.c283140.withValues(alpha: 0.6),
                        border: Border.all(
                          color: AppColors.cBC5A08.withValues(alpha: 0.2),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 31.5.sp,
                          vertical: 16.sp,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Rating Success",
                              style: TextFontStyle.textStyle16cFFFFFFInter600
                                  .copyWith(fontSize: 20),
                            ),
                            UIHelper.verticalSpace(12.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColors.cFCD34D,
                                  size: 32.sp,
                                ),
                                UIHelper.horizontalSpace(8.w),
                                Text(
                                  "+${widget.rewards}",
                                  style:
                                      TextFontStyle.textStyle40cFFFFFFSitka700,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    UIHelper.verticalSpace(48.h),
                    SizedBox(
                      height: 101.h,
                      width: 289.w,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 16.0.sp,
                              right: 16.sp,
                              top: 24.sp,
                            ),
                            child: Text(
                              "\"If you are greateful, I will surely increase you \"",
                              style: TextFontStyle.textStyle16cFFFFFFInter500,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          UIHelper.verticalSpace(8.h),
                          Text(
                            "Activity: ${widget.title}",
                            style: TextFontStyle.textStyle14cFFFFFFInter400,
                          ),
                        ],
                      ),
                    ),
                    UIHelper.verticalSpace(40.h),
                    GestureDetector(
                      onTap: () {
                        NavigationService.goBack;
                      },
                      child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.c283140.withValues(alpha: 0.5),
                              AppColors.c283140.withValues(alpha: 0),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.cEDE3BA),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.sp,
                            horizontal: 24.sp,
                          ),
                          child: Text(
                            "Continue",
                            style: TextFontStyle.textStyle16cFFFFFFInter500,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
