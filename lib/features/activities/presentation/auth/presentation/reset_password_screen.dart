import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/common_widgets/common_text_field.dart';
import '../../../../../common_widgets/common_back_arrow.dart';
import '../../../../../common_widgets/custom_toast.dart';
import '../../../../../constants/text_font_style.dart';
import '../../../../../constants/validator.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../helpers/all_routes.dart';
import '../../../../../helpers/loading_helper.dart';
import '../../../../../helpers/navigation_service.dart';
import '../../../../../helpers/ui_helpers.dart';
import '../../../../../networks/api_acess.dart';
import 'widget/common_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  const ResetPasswordScreen({super.key, required this.email});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: UIHelper.kDefaulutPadding(),
          ),
          child: Column(
            children: [
              const CommonBackArrowWidget(),
              UIHelper.verticalSpace(32.h),
              SizedBox(
                width: 80.w,
                height: 80.h,
                child:
                    Image.asset(Assets.icons.appLogo.path, fit: BoxFit.contain),
              ),
              UIHelper.verticalSpace(8.h),
              Text(
                "Iman Flow",
                style: TextFontStyle.textStyle24cFFFFFFGeorgia700,
              ),
              UIHelper.verticalSpace(32.h),
              Text(
                "Set new password",
                style: TextFontStyle.textStyle24cFFFFFFInter600,
              ),
              UIHelper.verticalSpace(8.h),
              SizedBox(
                height: 21.h,
                width: 288.w,
                child: Text(
                  "Enter your new passsword for Deen Trracker",
                  style: TextFontStyle.textStyle14c979CA8Inter400,
                  textAlign: TextAlign.center,
                ),
              ),
              UIHelper.verticalSpace(24.h),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CommonTextFieldWidget(
                        lable: 'New Password',
                        hinttext: '**********',
                        isObscure: true,
                        controller: _newPasswordController,
                        validator: passwordValidator,
                      ),
                      UIHelper.verticalSpace(16.h),
                      CommonTextFieldWidget(
                          lable: 'Confirm New Password',
                          hinttext: '**********',
                          isObscure: true,
                          controller: _confirmNewPasswordController,
                          validator: (v) {
                            return confirmPasswordValidator(
                                v!, _newPasswordController.text);
                          }),
                    ],
                  )),
              UIHelper.verticalSpace(24.h),
              CustomButton(
                lable: 'Reset Password',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    postResetsNewPasswordRxObj
                        .postResetsNewPassword(
                            email: widget.email,
                            newPassword: _newPasswordController.text,
                            confirmNewPassword:
                                _confirmNewPasswordController.text)
                        .waitingForFutureWithoutBg()
                        .then((v) {
                      if (v) {
                        NavigationService.navigateToUntilReplacement(
                            Routes.signInScreen);
                        customToastMessage(
                            'Success', 'Password Reset Successfully');
                      }
                    });
                  }
                },
              ),
              UIHelper.verticalSpace(16.h),
            ],
          ),
        ),
      ),
    );
  }
}
