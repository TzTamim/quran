import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/waiting_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../networks/api_acess.dart';
import '../../activities/presentation/auth/presentation/widget/common_back_arrow.dart';
import '../model/user_profile_res_model.dart';
import 'widgets/account_information.dart';
import 'widgets/danger_zone.dart';
import 'widgets/feedback_popup.dart';
import 'widgets/notification_section.dart';
import 'widgets/subscription.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool isSelected = false;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200.w,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
          child: const CommonBackArrowWidget(),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
          child: SingleChildScrollView(
            child: StreamBuilder(
                stream: getProfileRxObj.fileData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: WaitingWidget());
                  } else if (!snapshot.hasError && snapshot.data != null) {
                    ProfileResModel profileResModel =
                        ProfileResModel.fromJson(snapshot.data);
                    log("====> ${profileResModel.data?.fullName}");
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.sp),
                          decoration: BoxDecoration(
                            color: AppColors.c1B2638,
                            border: Border.all(color: AppColors.c4B352C),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                Assets.icons.setting.path,
                                height: 40.h,
                                width: 40.w,
                              ),
                              UIHelper.verticalSpace(12.h),
                              Text(
                                "Settings",
                                style: TextFontStyle
                                    .textStyle32cFDE68AGeorgia700
                                    .copyWith(color: AppColors.cEDE3BA),
                              ),
                              UIHelper.verticalSpace(12.h),
                              Text(
                                "Manage your account and preferences",
                                style: TextFontStyle.textStyle16c798090Inter500
                                    .copyWith(color: AppColors.cAFA26B),
                              ),
                            ],
                          ),
                        ),

                        UIHelper.verticalSpace(20.h),
                        AccountInformation(
                            name: profileResModel.data?.fullName ?? "",
                            email: profileResModel.data?.email ?? ""),

                        //Subscription
                        UIHelper.verticalSpace(20.h),
                        const Subscription(),
                        //notification
                        UIHelper.verticalSpace(20.h),
                        const NotificationSection(),

                        UIHelper.verticalSpace(20.h),

                        //privacy & data
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.c1B2638,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.c4B352C),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(16.sp),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      Assets.icons.privacyIcon.path,
                                      height: 16.h,
                                      width: 16.w,
                                      color: AppColors.cEDE3BA,
                                    ),
                                    UIHelper.horizontalSpace(8.w),
                                    Text(
                                      "Privacy & Data",
                                      style: TextFontStyle
                                          .textStyle16cEDE3BAInter700,
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(color: AppColors.c4B352C),
                              Container(
                                padding: EdgeInsets.all(16.sp),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 16.sp,
                                        horizontal: 8.sp,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: AppColors.c17202D,
                                        border: Border.all(
                                            color: AppColors.c4B352C),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            Assets.icons.download.path,
                                            height: 16.h,
                                            width: 16.w,
                                          ),
                                          UIHelper.horizontalSpace(10.w),
                                          Text(
                                            "Export My Data",
                                            style: TextFontStyle
                                                .textStyle16cFDE68AInter700,
                                          ),
                                        ],
                                      ),
                                    ),
                                    UIHelper.verticalSpace(16.h),
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 16.sp,
                                        horizontal: 8.sp,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: AppColors.c17202D,
                                        border: Border.all(
                                            color: AppColors.c4B352C),
                                      ),
                                      child: Text(
                                        "Privacy Policy",
                                        style: TextFontStyle
                                            .textStyle16cFDE68AInter700,
                                      ),
                                    ),
                                    UIHelper.verticalSpace(16.h),
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 16.sp,
                                        horizontal: 8.sp,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: AppColors.c17202D,
                                        border: Border.all(
                                            color: AppColors.c4B352C),
                                      ),
                                      child: Text(
                                        "Term of Service",
                                        style: TextFontStyle
                                            .textStyle16cFDE68AInter700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        UIHelper.verticalSpace(20.h),

                        //support
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.c1B2638,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.c4B352C),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(16.sp),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      Assets.icons.messageIcon.path,
                                      height: 16.h,
                                      width: 16.w,
                                      color: AppColors.cEDE3BA,
                                    ),
                                    UIHelper.horizontalSpace(8.w),
                                    Text(
                                      "Support",
                                      style: TextFontStyle
                                          .textStyle16cEDE3BAInter700,
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(color: AppColors.c4B352C),
                              Container(
                                padding: EdgeInsets.all(16.sp),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 16.sp,
                                        horizontal: 8.sp,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: AppColors.c17202D,
                                        border: Border.all(
                                            color: AppColors.c4B352C),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            Assets.icons.messageIcon.path,
                                            height: 16.h,
                                            width: 16.w,
                                          ),
                                          UIHelper.horizontalSpace(10.w),
                                          Text(
                                            "Contact Support",
                                            style: TextFontStyle
                                                .textStyle16cFDE68AInter700,
                                          ),
                                        ],
                                      ),
                                    ),
                                    UIHelper.verticalSpace(16.h),
                                    GestureDetector(
                                      onTap: () {
                                        FeedbackPopup.show(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 16.sp,
                                          horizontal: 8.sp,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: AppColors.c17202D,
                                          border: Border.all(
                                              color: AppColors.c4B352C),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              Assets.icons.feedbackSend.path,
                                              height: 16.h,
                                              width: 16.w,
                                            ),
                                            UIHelper.horizontalSpace(10.w),
                                            Text(
                                              "Send Feedback",
                                              style: TextFontStyle
                                                  .textStyle16cFDE68AInter700,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    UIHelper.verticalSpace(16.h),
                                    Text(
                                      "App Version 1.0.0. Made with ❤️ for the Muslim\n                             community",
                                      style: TextFontStyle
                                          .textStyle12cFFFFFFInter500
                                          .copyWith(color: AppColors.cAFA26B),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        UIHelper.verticalSpace(20.h),
                        //danger zone
                        const DangerZone(),
                        //
                      ],
                    );
                  } else {
                    return const Center(child: WaitingWidget());
                  }
                }),
          ),
        ),
      ),
    );
  }
}
