import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/text_font_style.dart';
import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import '../helpers/ui_helpers.dart';

class CommonTextFieldWidget extends StatelessWidget {
  final String lable;
  final String hinttext;
  final bool isObscure;
  final TextEditingController controller;

  const CommonTextFieldWidget({
    super.key,
    required this.controller,
    required this.lable,
    required this.hinttext,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(lable, style: TextFontStyle.textStyle12c6A7283Inter400),
        UIHelper.verticalSpace(16.h),
        SizedBox(
          height: 48.h,
          width: double.infinity,
          child: TextFormField(
            controller: controller,
            obscureText: isObscure,
            style: TextFontStyle.textStyle12c798090Inter400,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: SizedBox(
                  height: 16.h,
                  width: 16.w,
                  child: Image.asset(
                    isObscure
                        ? Assets.icons.lock.path
                        : Assets.icons.email.path,
                  ),
                ),
              ),
              prefixIconConstraints:
                  BoxConstraints(minWidth: 40.w, minHeight: 40.h),
              hintText: hinttext,
              hintStyle: TextFontStyle.textStyle12c798090Inter400,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              fillColor: AppColors.c283140,
              filled: true,
            ),
          ),
        ),
      ],
    );
  }
}
