import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_constants.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/di.dart';
import '../../../../helpers/helper_methods.dart';
import '../../../../helpers/loading_helper.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../networks/api_acess.dart';

class DangerZone extends StatefulWidget {
  const DangerZone({super.key});

  @override
  State<DangerZone> createState() => _DangerZoneState();
}

class _DangerZoneState extends State<DangerZone> {
  void _deleteAccount() async {
    deleteAccountRxObj
        .deleteAccount()
        .waitingForFutureWithoutBg()
        .then((v) async {
      if (v) {
        await appData.write(kKeyAccessToken, "");
        await appData.write(kKeyIsLoggedIn, false);

        NavigationService.navigateToUntilReplacement(Routes.signInScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Assets.icons.deleteIcon.path,
                  height: 16.h,
                  width: 16.w,
                ),
                UIHelper.horizontalSpace(8.w),
                Text(
                  "Danger Zone",
                  style: TextFontStyle.textStyle16cEDE3BAInter700
                      .copyWith(color: AppColors.cF6A1A2),
                ),
              ],
            ),
          ),
          const Divider(color: AppColors.c4B352C),
          GestureDetector(
            onTap: () {
              postLogOutRxObj
                  .postLogOut(refreshToken: appData.read(kKeyRefreshToken))
                  .waitingForFutureWithoutBg()
                  .then((v) {
                NavigationService.navigateToUntilReplacement(
                    Routes.signInScreen);
              });
            },
            child: Container(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                children: [
                  Container(
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.c17202D,
                      border: Border.all(color: AppColors.c4B352C),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.icons.logout.path,
                          height: 16.h,
                          width: 16.w,
                        ),
                        UIHelper.horizontalSpace(10.w),
                        Text(
                          "Logout",
                          style: TextFontStyle.textStyle14cAFA26BInter600
                              .copyWith(color: AppColors.cDF6768),
                        ),
                      ],
                    ),
                  ),
                  UIHelper.verticalSpace(16.h),
                  Container(
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.c17202D,
                      border: Border.all(color: AppColors.c4B352C),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        await deleteAccountConfirmation(
                            context: context,
                            onConfirm: () {
                              _deleteAccount();
                            });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.icons.deleteIcon.path,
                            height: 16.h,
                            width: 16.w,
                          ),
                          UIHelper.horizontalSpace(10.w),
                          Text(
                            "Delete Account",
                            style: TextFontStyle.textStyle14cAFA26BInter600
                                .copyWith(color: AppColors.cDF6768),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
