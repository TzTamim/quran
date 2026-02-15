import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common_widgets/common_text_field.dart';
import '../../../../../constants/text_font_style.dart';
import '../../../../../constants/validator.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../helpers/all_routes.dart';
import '../../../../../helpers/loading_helper.dart';
import '../../../../../helpers/navigation_service.dart';
import '../../../../../helpers/ui_helpers.dart';
import '../../../../../networks/api_acess.dart';
import 'widget/auth_rich_text_button.dart';
import 'widget/common_button.dart';
import 'widget/google_sign_in_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF17202D),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: UIHelper.kDefaulutPadding(),
            right: UIHelper.kDefaulutPadding(),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                UIHelper.verticalSpace(44.h),
                SizedBox(
                  width: 80.w,
                  height: 80.h,
                  child: Image.asset(Assets.icons.appLogo.path,
                      fit: BoxFit.contain),
                ),
                UIHelper.verticalSpace(8.h),
                Text(
                  "Iman Flow",
                  style: TextFontStyle.textStyle24cFFFFFFGeorgia700,
                ),
                UIHelper.verticalSpace(32.h),
                Text(
                  "Create your account",
                  style: TextFontStyle.textStyle24cFFFFFFInter600,
                ),
                UIHelper.verticalSpace(24.h),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CommonTextFieldWidget(
                          lable: 'Email',
                          hinttext: 'you@example.com',
                          isObscure: false,
                          controller: _emailController,
                          validator: emailValidator,
                        ),
                        UIHelper.verticalSpace(16.h),
                        CommonTextFieldWidget(
                          lable: 'Password',
                          hinttext: '**********',
                          isObscure: true,
                          controller: _passwordController,
                          validator: passwordValidator,
                        ),
                      ],
                    )),
                UIHelper.verticalSpace(24.h),
                CustomButton(
                  lable: 'Create Account',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      postSignupRxObj
                          .postSignup(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim())
                          .waitingForFutureWithoutBg()
                          .then((v) {
                        if (v) {
                          NavigationService.navigateToUntilReplacement(
                              Routes.navigationScreen);
                        }
                      });
                    }
                  },
                ),
                UIHelper.verticalSpace(16.h),
                Row(
                  children: [
                    Expanded(
                      child: SocialLoginButton(
                        iconPath: Assets.icons.google.path,
                        label: 'Google',
                        onTap: () {},
                      ),
                    ),
                    UIHelper.horizontalSpace(16.w),
                    Expanded(
                      child: SocialLoginButton(
                        iconPath: Assets.icons.apple.path,
                        label: 'Apple',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(32.h),
                authRichTextButton(
                  textstyle: TextFontStyle.textStyle12c798090Inter400,
                  text: "Already have an account? ",
                  buttonText: "Sign In",
                  butoonTextStyle: TextFontStyle.textStyle12c798090Inter400
                      .copyWith(color: AppColors.cBC5A08),
                  onTap: () {
                    NavigationService.navigateTo(Routes.signInScreen);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
