import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/app_constants.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/di.dart';
import '../../../../helpers/loading_helper.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../networks/api_acess.dart';

class LogoutPopup {
  static void show(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 193.h,
            width: 291.w,
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 54.h,
                  width: 267.w,
                  decoration: const BoxDecoration(
                    color: AppColors.cF5F6F7,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 72.sp,
                      vertical: 12.sp,
                    ),
                    child: Text(
                      "Log Out",
                      style: TextFontStyle.textStyle20cFFFFFFPoppins500,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Text(
                  "Are you sure you want to logout",
                  style: TextFontStyle.textStyle16c404A60Inter400,
                ),
                UIHelper.verticalSpace(24.h),
                Container(
                  height: 53.h,
                  width: 267.w,
                  decoration: const BoxDecoration(
                    color: AppColors.cF5F6F7,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            NavigationService.goBack;
                          },
                          child: Text(
                            "Cancel",
                            style: TextFontStyle.textStyle18c404A60Poppins500,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await postLogOutRxObj
                                .postLogOut(
                                    refreshToken:
                                        appData.read(kKeyRefreshToken))
                                .waitingForFutureWithoutBg()
                                .then((v) async {
                              await appData.write(kKeyIsLoggedIn, false);
                              await appData.write(kKeyAccessToken, "");
                              await appData.write(kKeyRefreshToken, "");
                              await NavigationService
                                  .navigateToUntilReplacement(
                                      Routes.signInScreen);
                            });
                          },
                          child: Text(
                            "Confirm",
                            style: TextFontStyle.textStyle18c2FA75FPoppins500
                                .copyWith(
                              color: AppColors.c2FA75F.withValues(alpha: 0.2),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
