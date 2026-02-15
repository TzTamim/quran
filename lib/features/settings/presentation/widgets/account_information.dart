import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widgets/custom_textfield.dart';
import '../../../../common_widgets/custom_toast.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/loading_helper.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../networks/api_acess.dart';

class AccountInformation extends StatefulWidget {
  final String email;
  final String name;
  const AccountInformation(
      {super.key, required this.email, required this.name});

  @override
  State<AccountInformation> createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
    _emailController.text = widget.email;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

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
                Assets.icons.accountInfo.path,
                height: 16.h,
                width: 16.w,
              ),
              UIHelper.horizontalSpace(8.w),
              Text(
                "Account Information",
                style: TextFontStyle.textStyle16cEDE3BAInter700,
              ),
            ],
          ),
          const Divider(color: AppColors.c4B352C),
          Container(
            padding: EdgeInsets.only(
              left: 16.sp,
              right: 16.sp,
              top: 8.sp,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Full Name",
                  style: TextFontStyle.textStyle16cFDE68AInter700,
                ),
                UIHelper.verticalSpace(8.h),
                CustomTextField(
                  controller: _nameController,
                  maxLines: 1,
                  height: 44.h,
                  hintText: "Enter your name",
                  cursorColor: AppColors.cEDE3BA,
                  hintStyle: TextFontStyle.textStyle16c798090Inter500
                      .copyWith(color: AppColors.c5A6270),
                  borderColor: AppColors.c4B352C,
                  textStyle: TextFontStyle.textStyle16c798090Inter500
                      .copyWith(color: AppColors.cEDE3BA),
                ),
                UIHelper.verticalSpace(16.h),
                Text(
                  "Email Address",
                  style: TextFontStyle.textStyle16cFDE68AInter700,
                ),
                UIHelper.verticalSpace(8.h),
                CustomTextField(
                  readOnly: true,
                  controller: _emailController,
                  maxLines: 1,
                  height: 44.h,
                  hintText: "saifahamed@gmail.com",
                  cursorColor: AppColors.cEDE3BA,
                  hintStyle: TextFontStyle.textStyle16c798090Inter500
                      .copyWith(color: AppColors.c5A6270),
                  borderColor: AppColors.c4B352C,
                  textStyle: TextFontStyle.textStyle16c798090Inter500
                      .copyWith(color: AppColors.cEDE3BA),
                ),
                UIHelper.verticalSpace(4.h),
                Text(
                  "Email cannot be changed",
                  style: TextFontStyle.textStyle12pxcAFA26BInter500
                      .copyWith(color: AppColors.c997D2E),
                ),
                UIHelper.verticalSpace(16.h),
                GestureDetector(
                  onTap: () {
                    putProfileRxObj
                        .putProfileUpdate(
                          name: _nameController.text,
                        )
                        .waitingForFutureWithoutBg()
                        .then((v) {
                      if (v) {
                        getProfileRxObj.getProfile();
                        customToastMessage(
                            "Success", "Profile updated successfully");
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.sp,
                      vertical: 10.sp,
                    ),
                    width: 166.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.cD87606,
                          AppColors.cBC5A08,
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.icons.document.path,
                          height: 20.h,
                          width: 20.w,
                        ),
                        UIHelper.horizontalSpace(8.w),
                        Text(
                          "Save Change",
                          style: TextFontStyle.textStyle16cC7394BInter700
                              .copyWith(color: AppColors.c17202D),
                        ),
                      ],
                    ),
                  ),
                ),
                UIHelper.verticalSpace(4.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
