import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import '../../../../../common_widgets/common_back_arrow.dart';
import '../../../../../common_widgets/custom_toast.dart';
import '../../../../../constants/text_font_style.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../helpers/all_routes.dart';
import '../../../../../helpers/loading_helper.dart';
import '../../../../../helpers/navigation_service.dart';
import '../../../../../helpers/ui_helpers.dart';
import '../../../../../networks/api_acess.dart';
import 'widget/common_button.dart';

class OtpValidationScreen extends StatefulWidget {
  final String email;
  const OtpValidationScreen({super.key, required this.email});

  @override
  State<OtpValidationScreen> createState() => _OtpValidationScreenState();
}

class _OtpValidationScreenState extends State<OtpValidationScreen> {
  final TextEditingController _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: UIHelper.kDefaulutPadding(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CommonBackArrowWidget(),
              UIHelper.verticalSpace(63.h),
              SizedBox(
                width: 80.w,
                height: 80.h,
                child:
                    Image.asset(Assets.icons.appLogo.path, fit: BoxFit.contain),
              ),
              UIHelper.verticalSpace(24.h),
              Text(
                "Code has been send to \n svs***@outlook.com",
                style: TextFontStyle.textStyle24cFFFFFFInter600,
              ),
              UIHelper.verticalSpace(48.h),
              Pinput(
                controller: _pinController,
                length: 4,
                focusedPinTheme: PinTheme(
                  height: 60.h,
                  width: 60.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.cE16909,
                  ),
                ),
                defaultPinTheme: PinTheme(
                  width: 60.w,
                  height: 60.h,
                  textStyle: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.cEBECEF,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.c283140,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              UIHelper.verticalSpace(24.h),
              RichText(
                text: TextSpan(
                  text: "Resend code in ",
                  style: TextFontStyle.textStyle14c979CA8Inter400.copyWith(
                    color: AppColors.cEBECEF,
                  ),
                  children: [
                    TextSpan(
                      text: "55",
                      style: TextFontStyle.textStyle14c979CA8Inter400.copyWith(
                        color: AppColors.cD08D06,
                      ),
                      children: [
                        TextSpan(
                          text: " s",
                          style: TextFontStyle.textStyle14c979CA8Inter400
                              .copyWith(color: AppColors.cEBECEF),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpace(44.h),
              CustomButton(
                  lable: 'Verify',
                  onTap: () {
                    if (_pinController.text.length < 4) {
                      customToastMessage("Failed", "Please enter valid OTP");
                    } else {
                      postOtpVerifyRxObj
                          .postOtpVerify(
                              email: widget.email, code: _pinController.text)
                          .waitingForFutureWithoutBg()
                          .then((v) {
                        if (v) {
                          Navigator.of(NavigationService.context)
                              .pushReplacementNamed(Routes.resetPasswordScreen,
                                  arguments: {
                                'email': widget.email,
                              });
                        }
                      });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
