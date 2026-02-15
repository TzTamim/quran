import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common_widgets/common_back_arrow.dart';
import '../../../../../common_widgets/common_text_field.dart';
import '../../../../../constants/text_font_style.dart';
import '../../../../../constants/validator.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../helpers/all_routes.dart';
import '../../../../../helpers/loading_helper.dart';
import '../../../../../helpers/navigation_service.dart';
import '../../../../../helpers/ui_helpers.dart';
import '../../../../../networks/api_acess.dart';
import 'widget/common_button.dart';


class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void deactivate() {
    _emailController.dispose();
    super.deactivate();
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
              UIHelper.verticalSpace(11.h),
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
                "Reset your password",
                style: TextFontStyle.textStyle24cFFFFFFInter600,
              ),
              UIHelper.verticalSpace(8.h),
              Text(
                "Enter your email and we'll send you a link to reset your password.",
                style: TextFontStyle.textStyle14c979CA8Inter400,
                textAlign: TextAlign.center,
              ),
              UIHelper.verticalSpace(24.h),
              Form(
                key: _formKey,
                child: CommonTextFieldWidget(
                  validator: emailValidator,
                  lable: 'Email',
                  hinttext: 'you@example.com',
                  isObscure: false,
                  controller: _emailController,
                ),
              ),
              UIHelper.verticalSpace(24.h),
              CustomButton(
                lable: 'Send OTP',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    postForgetPasswordRxObj
                        .postForgetPassword(email: _emailController.text)
                        .waitingForFutureWithoutBg()
                        .then((v) {
                      if (v) {
                        Navigator.of(NavigationService.context)
                            .pushReplacementNamed(Routes.otpScreen, arguments: {
                          'email': _emailController.text,
                        });
                      }
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
