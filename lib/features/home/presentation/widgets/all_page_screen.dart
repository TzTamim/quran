import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';


class AllPageScreen extends StatelessWidget {
  const AllPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("New", style: TextFontStyle.textStyle14c17202DInter600),
        UIHelper.verticalSpace(16.h),
        Row(
          children: [
            SizedBox(height: 32.h, width: 32.w, child: const Placeholder()),
            UIHelper.horizontalSpace(4.w),
            SizedBox(
              height: 39.h,
              width: 195.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "It’s time for Fajr prayer.",
                    style: TextFontStyle.textStyle14c17202DInter600,
                  ),
                  Text(
                    "It is a long established fact that ..",
                    style: TextFontStyle.textStyle12c17202DInter400,
                  ),
                ],
              ),
            ),

            // UiHelper.horizontalspace(8.w),
            Column(
              // mainAxisAlignment: .spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40.sp, bottom: 12.sp),
                  child: Icon(Icons.circle, size: 8.sp),
                ),
                Text(
                  "5 min ago",
                  style: TextFontStyle.textStyle12c17202DInter400,
                ),
              ],
            ),
          ],
        ),
        UIHelper.verticalSpace(8.h),
        const Divider(thickness: 1.5),
        Row(
          children: [
            UIHelper.horizontalSpace(12.w),
            SizedBox(height: 24.h, width: 24.w, child: const Placeholder()),
            UIHelper.horizontalSpace(8.w),
            SizedBox(
              height: 55.h,
              width: 180.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Read a few verses of Qur’an today.",
                    style: TextFontStyle.textStyle14c17202DInter600,
                  ),
                  Text(
                    "It is a long established fact that ..",
                    style: TextFontStyle.textStyle12c17202DInter400,
                  ),
                ],
              ),
            ),
            UIHelper.horizontalSpace(8.w),
            Column(
              // mainAxisAlignment: .spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40.sp, bottom: 12.sp),
                  child: Icon(Icons.circle, size: 8.sp),
                ),
                Text(
                  "15 min ago",
                  style: TextFontStyle.textStyle12c17202DInter400,
                ),
              ],
            ),
          ],
        ),
        UIHelper.verticalSpace(8.h),
        const Divider(thickness: 1.5),
        UIHelper.verticalSpace(16.h),
        Text("Yesterday", style: TextFontStyle.textStyle14c17202DInter600),
        Container(
          padding: EdgeInsets.all(12.sp),
          height: 121.h,
          width: 303.w,
          child: Row(
            children: [
              SizedBox(height: 32.h, width: 32.w, child: const Placeholder()),
              UIHelper.horizontalSpace(8.w),
              SizedBox(
                height: 55.h,
                width: 180.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Don’t forget your morning Adhkar.",
                      style: TextFontStyle.textStyle14c17202DInter600,
                    ),
                    Text(
                      "It is a long established fact that ..",
                      style: TextFontStyle.textStyle12c17202DInter400,
                    ),
                  ],
                ),
              ),
              Text(
                "1 days ago",
                style: TextFontStyle.textStyle12c17202DInter400,
              ),
            ],
          ),
        ),
        UIHelper.verticalSpace(8.h),
        const Divider(thickness: 1.5),
        UIHelper.verticalSpace(16.h),
        Text("Oct 20, 25", style: TextFontStyle.textStyle14c17202DInter600),
        Container(
          padding: EdgeInsets.all(12.sp),
          height: 121.h,
          width: 303.w,
          child: Row(
            children: [
              SizedBox(height: 32.h, width: 32.w, child: const Placeholder()),
              UIHelper.horizontalSpace(8.w),
              SizedBox(
                height: 55.h,
                width: 180.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Suhoor time is about to end.",
                      style: TextFontStyle.textStyle14c17202DInter600,
                    ),
                    Text(
                      "It is a long established fact that ..",
                      style: TextFontStyle.textStyle12c17202DInter400,
                    ),
                  ],
                ),
              ),
              Text(
                "Oct 20, 25",
                style: TextFontStyle.textStyle12c17202DInter400,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
