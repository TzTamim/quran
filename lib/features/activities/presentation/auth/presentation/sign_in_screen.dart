import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common_widgets/common_text_field.dart';
import '../../../../../constants/app_constants.dart';
import '../../../../../constants/text_font_style.dart';
import '../../../../../constants/validator.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../helpers/all_routes.dart';
import '../../../../../helpers/di.dart';
import '../../../../../helpers/loading_helper.dart';
import '../../../../../helpers/navigation_service.dart';
import '../../../../../helpers/ui_helpers.dart';
import '../../../../../networks/api_acess.dart';
import 'widget/auth_rich_text_button.dart';
import 'widget/check_box.dart';
import 'widget/common_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isRememberMe = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: UIHelper.kDefaulutPadding(),
            right: UIHelper.kDefaulutPadding(),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                UIHelper.verticalSpace(63.h),
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
                  "Let’s Sign In",
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
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 200.w,
                        child: RememberMeCheckBox(onChanged: (value) {
                          _isRememberMe = value;
                        })),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.c979CA8,
                        surfaceTintColor: Colors.transparent,
                      ),
                      onPressed: () {
                        NavigationService.navigateTo(
                            Routes.forgetPasswordScreen);
                      },
                      child: Text(
                        "Forget Password?",
                        style: TextFontStyle.textStyle12c979CA8Inter400
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                UIHelper.verticalSpace(24.h),
                CustomButton(
                  lable: 'Sign In',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      postLoginRxObj
                          .postLogin(
                              email: _emailController.text,
                              password: _passwordController.text)
                          .waitingForFutureWithoutBg()
                          .then((v) {
                        if (v) {
                          if (_isRememberMe) {
                            appData.write(kKeyIsLoggedIn, true);
                          }
                          NavigationService.navigateTo(Routes.navigationScreen);
                        }
                      });
                    }
                  },
                ),
                UIHelper.verticalSpace(24.h),
                authRichTextButton(
                  textstyle: TextFontStyle.textStyle12c798090Inter400,
                  text: "Don't have an account? ",
                  buttonText: "Sign Up",
                  butoonTextStyle: TextFontStyle.textStyle12c798090Inter400
                      .copyWith(color: AppColors.cBC5A08),
                  onTap: () {
                    NavigationService.navigateTo(Routes.signUpScreen);
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
