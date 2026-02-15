import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';
import 'switch_field.dart';

class NotificationSection extends StatelessWidget {
  const NotificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: AppColors.c1B2638,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.c4B352C),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                Assets.icons.notification.path,
                height: 16.h,
                width: 16.w,
              ),
              UIHelper.horizontalSpace(8.w),
              Text(
                "Notification",
                style: TextFontStyle.textStyle16cEDE3BAInter700,
              ),
            ],
          ),
          const Divider(color: AppColors.c4B352C),
          Column(
            children: [
              const SwitchField(
                isSwitched: true,
                title: "Daily Reminder",
                subtitle: "Get reminded to complete your activities",
              ),
              UIHelper.verticalSpace(4.h),
              const Divider(color: AppColors.c4B352C),
              UIHelper.verticalSpace(16.h),
              const SwitchField(
                isSwitched: true,
                title: "Daily Reminder",
                subtitle: "Get reminded to complete your activities",
              ),
              UIHelper.verticalSpace(4.h),
              const Divider(color: AppColors.c4B352C),
              UIHelper.verticalSpace(16.h),
              const SwitchField(
                isSwitched: true,
                title: "Daily Reminder",
                subtitle: "Get reminded to complete your activities",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
