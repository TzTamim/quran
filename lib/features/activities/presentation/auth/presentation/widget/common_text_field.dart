import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../constants/text_font_style.dart';
import '../../../../../../gen/colors.gen.dart';
import '../../../../../../helpers/ui_helpers.dart';

class CommonTextFieldWidget extends StatelessWidget {
  final String lable;
  final String hinttext;
  final bool isObscure;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CommonTextFieldWidget({
    super.key,
    this.validator,
    required this.lable,
    required this.hinttext,
    required this.isObscure,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lable, style: TextFontStyle.textStyle16cC1C4CCInter600),
        UIHelper.verticalSpace(8.h),
        SizedBox(
          width: double.infinity,
          child: TextFormField(
            obscureText: isObscure,
            validator: validator,
            controller: controller,
            cursorColor: AppColors.c798090,
            style: TextFontStyle.textStyle12c6A7283Inter400,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                    left: 10.0, top: 16.h, bottom: 16.h, right: 8.w),
                child: SizedBox(
                  height: 16.h,
                  width: 16.w,
                  child: Image.asset(
                    isObscure
                        ? "assets/icons/lock.png"
                        : "assets/icons/email.png",
                    fit: BoxFit.contain,
                    color: AppColors.c798090,
                  ),
                ),
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 16.w,
                minHeight: 16.h,
              ),
              hintText: hinttext,
              hintStyle: TextFontStyle.textStyle12c6A7283Inter400,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              fillColor: AppColors.c283140,
              filled: true,
            ),
          ),
        ),
      ],
    );
  }
}
