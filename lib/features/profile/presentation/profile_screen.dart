import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/helper_methods.dart';
import '../../../helpers/ui_helpers.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DateTime focusedDay = DateTime.now();
  DateTime? firstDay;
  DateTime? lastDay;
  String monthName = DateFormat.MMMM().format(DateTime.now());

  ValueNotifier<XFile?> profileImage = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    initialize();
  }

  initialize() {
    focusedDay = DateTime.now();
    firstDay = DateTime(
      focusedDay.year - 5,
      focusedDay.month,
      focusedDay.day,
    );

    lastDay = DateTime(
      focusedDay.year + 10,
      focusedDay.month,
      focusedDay.day,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<DateTime> usedDates = [
      DateTime(2025, 12, 8),
      DateTime(2025, 12, 7),
    ];

    bool isSameDay(DateTime a, DateTime b) =>
        a.year == b.year && a.month == b.month && a.day == b.day;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ValueListenableBuilder(
                        valueListenable: profileImage,
                        builder: (context, image, child) {
                          return Container(
                            height: 100.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: image != null
                                    ? FileImage(File(image.path))
                                    : AssetImage(
                                        Assets.images.placeholderImage.path),
                              ),
                            ),
                          );
                        }),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () async {
                          profileImage.value = await pickImage();
                        },
                        child: Container(
                          height: 24.h,
                          width: 24.w,
                          padding: EdgeInsets.all(6.sp),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.cFFFFFF,
                          ),
                          child: Image.asset(
                            Assets.icons.edit.path,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(16.h),
                Text(
                  "Saif Ahamed",
                  style: TextFontStyle.textStyle32cEDE3BAInter600,
                ),
                UIHelper.verticalSpace(16.h),
                Container(
                  height: 28.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [AppColors.cF59C0C, AppColors.cF97515],
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 9.5.sp,
                    vertical: 4.sp,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        Assets.icons.mingcuteAiFill.path,
                        height: 16.h,
                        width: 16.w,
                      ),
                      UIHelper.horizontalSpace(8.w),
                      Text(
                        "Premium Member",
                        style: TextFontStyle.textStyle14cAFA26BInter600
                            .copyWith(color: AppColors.c17202D),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(12.h),
                Container(
                  height: 28.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.c0E141B,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 9.5.sp,
                    vertical: 4.sp,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        Assets.icons.resetsIcon.path,
                        height: 16.h,
                        width: 16.w,
                      ),
                      UIHelper.horizontalSpace(8.w),
                      Text(
                        "Reset Progress",
                        style: TextFontStyle.textStyle14cBA9941Inter400
                            .copyWith(color: AppColors.cF87171),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Container(
                  padding: EdgeInsets.all(16.sp),
                  height: 104.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.c4B352C),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.w,
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          gradient: const LinearGradient(
                            colors: [AppColors.cF59C0C, AppColors.cF97515],
                          ),
                        ),
                        child: Image.asset(
                          Assets.icons.spiritualLevel.path,
                        ),
                      ),
                      UIHelper.horizontalSpace(12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UIHelper.verticalSpace(4.h),
                          Text(
                            "Spiritual Level",
                            style: TextFontStyle.textStyle14c979CA8Inter400
                                .copyWith(color: AppColors.cAFA26B),
                          ),
                          UIHelper.verticalSpace(8.h),
                          RichText(
                            text: TextSpan(
                              text: '44',
                              style: TextFontStyle.textStyle32cEDE3BAInter600,
                              children: [
                                TextSpan(
                                  text: "/99",
                                  style: TextFontStyle
                                      .textStyle18cFDE68AInter700
                                      .copyWith(color: AppColors.cAFA26B),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Container(
                  padding: EdgeInsets.all(16.sp),
                  height: 188.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.c4B352C),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.w,
                        padding: EdgeInsets.all(15.sp),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.cEE466E),
                        child: Image.asset(
                          Assets.icons.streak.path,
                          color: AppColors.cFFFFFF,
                        ),
                      ),
                      UIHelper.verticalSpace(12.h),
                      Text(
                        "Current Streak",
                        style: TextFontStyle.textStyle14cCFA128Inter500
                            .copyWith(color: AppColors.cAFA26B),
                      ),
                      UIHelper.verticalSpace(4.h),
                      Text(
                        "1",
                        style: TextFontStyle.textStyle32cEDE3BAInter600,
                      ),
                      Text(
                        "days",
                        style: TextFontStyle.textStyle14cBA9941Inter400
                            .copyWith(color: AppColors.cD08D06),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Container(
                  padding: EdgeInsets.all(16.sp),
                  height: 188.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.c582E92),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.w,
                        padding: EdgeInsets.all(15.sp),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.c7B60F3),
                        child: Image.asset(
                          Assets.icons.longestStreak.path,
                          color: AppColors.cFFFFFF,
                        ),
                      ),
                      UIHelper.verticalSpace(12.h),
                      Text(
                        "Longest Streak",
                        style: TextFontStyle.textStyle14cCFA128Inter500
                            .copyWith(color: AppColors.cAFA26B),
                      ),
                      UIHelper.verticalSpace(4.h),
                      Text(
                        "1",
                        style: TextFontStyle.textStyle32cEDE3BAInter600,
                      ),
                      Text(
                        "days",
                        style: TextFontStyle.textStyle14cBA9941Inter400
                            .copyWith(color: AppColors.cD08D06),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.cC1C4CC,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 14.sp,
                          right: 14.sp,
                          top: 16.sp,
                          bottom: 10.sp,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              Assets.icons.todaysGoals.path,
                              height: 16.h,
                              width: 16.w,
                              color: AppColors.c0F5649,
                            ),
                            UIHelper.horizontalSpace(10.w),
                            FittedBox(
                              child: Text(
                                "Activity Calendar - ${getMonthName(focusedDay.month)} ${focusedDay.year}",
                                style: TextFontStyle.textStyle16cC1C4CCInter600
                                    .copyWith(color: AppColors.c0F5649),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(color: AppColors.cDFE0E4),
                      TableCalendar(
                        focusedDay: focusedDay,
                        firstDay: firstDay!,
                        lastDay: lastDay!,
                        onPageChanged: (day) {
                          setState(() {
                            focusedDay = day;
                          });
                        },
                        daysOfWeekHeight: 24.h,
                        calendarBuilders: CalendarBuilders(
                          defaultBuilder: (context, day, focusedDay) {
                            final bool used = usedDates.any(
                              (d) => isSameDay(d, day),
                            );

                            if (used) {
                              return Padding(
                                padding: EdgeInsets.all(3.5.sp),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 39.h,
                                      width: 39.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          8,
                                        ),
                                        color: AppColors.c0A957B,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${day.day}',
                                        style: TextFontStyle
                                            .textStyle12cFFFFFFInter500
                                            .copyWith(
                                          color: AppColors.cEBECEF,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                            return null;
                          },
                        ),
                        rowHeight: 54,
                        headerVisible: false,
                        daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle: TextFontStyle.textStyle12c6A7283Inter400
                              .copyWith(fontWeight: FontWeight.w700),
                          weekendStyle: TextFontStyle.textStyle12c6A7283Inter400
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        calendarStyle: CalendarStyle(
                          cellMargin: EdgeInsets.all(4.sp),
                          outsideDaysVisible: true,
                          weekendTextStyle: TextFontStyle
                              .textStyle12cFFFFFFInter500
                              .copyWith(color: AppColors.c6A7283),
                          weekendDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.cEBECEF,
                          ),
                          defaultDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.cEBECEF,
                          ),
                          defaultTextStyle: TextFontStyle
                              .textStyle12cFFFFFFInter500
                              .copyWith(color: AppColors.c6A7283),
                          todayDecoration: BoxDecoration(
                            color: AppColors.cEDE3BA,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.cD08D06),
                          ),
                          todayTextStyle: TextFontStyle
                              .textStyle12cFFFFFFInter500
                              .copyWith(color: AppColors.cD08D06),
                        ),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Container(
                  padding: EdgeInsets.all(16.sp),
                  decoration: BoxDecoration(
                    color: AppColors.cC1C4CC,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.cFAFAFB),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.w,
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.c0A957B,
                        ),
                        child: Image.asset(
                          Assets.icons.spiritualLevel.path,
                          color: AppColors.cFFFFFF,
                        ),
                      ),
                      UIHelper.horizontalSpace(16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "This Month",
                            style: TextFontStyle.textStyle14cAFA26BInter600
                                .copyWith(color: AppColors.c404A60),
                          ),
                          UIHelper.verticalSpace(4),
                          Text(
                            '4',
                            style: TextFontStyle.textStyle24cFFFFFFInter600
                                .copyWith(color: AppColors.c17202D),
                          ),
                          UIHelper.verticalSpace(4),
                          Text(
                            "Points earned",
                            style: TextFontStyle.textStyle12cFFFFFFInter500
                                .copyWith(color: AppColors.c798090),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Container(
                  padding: EdgeInsets.all(16.sp),
                  decoration: BoxDecoration(
                    color: AppColors.cC1C4CC,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.cFAFAFB),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.w,
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.c596DF2,
                        ),
                        child: Image.asset(
                          Assets.icons.starNotFill.path,
                          color: AppColors.cFFFFFF,
                        ),
                      ),
                      UIHelper.horizontalSpace(16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Activities",
                            style: TextFontStyle.textStyle14cAFA26BInter600
                                .copyWith(color: AppColors.c404A60),
                          ),
                          UIHelper.verticalSpace(4),
                          Text(
                            '8',
                            style: TextFontStyle.textStyle24cFFFFFFInter600
                                .copyWith(color: AppColors.c17202D),
                          ),
                          UIHelper.verticalSpace(4),
                          Text(
                            "completed",
                            style: TextFontStyle.textStyle12cFFFFFFInter500
                                .copyWith(color: AppColors.c798090),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
