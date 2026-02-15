import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';
import 'custom_premium_card_popup.dart';
import 'logout_popup.dart';

class CustomNavigationDrawer extends StatefulWidget {
  const CustomNavigationDrawer({super.key});

  @override
  State<CustomNavigationDrawer> createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
  _navigation(String route) {
    NavigationService.goBack;
    NavigationService.navigateTo(route);
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        child: SafeArea(
          child: Drawer(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            backgroundColor: AppColors.c1B2638,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.sp),
                child: Column(
                  children: <Widget>[
                    buidHeader(context),
                    UIHelper.verticalSpace(50.h),
                    buildMenuItems(context)
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget buidHeader(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Iman Flow",
            style: TextFontStyle.textStyle24cFDE68AGeorgia700,
          ),
          IconButton(
              onPressed: () {
                NavigationService.goBack;
              },
              icon: Icon(Icons.close, color: AppColors.cFDE68A, size: 24.sp))
        ],
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: EdgeInsets.only(left: 12.sp),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _navigation(Routes.journalScreen);
              },
              child: Row(
                children: [
                  Image.asset(
                    Assets.icons.journal.path,
                    height: 20.h,
                    width: 20.w,
                  ),
                  UIHelper.horizontalSpace(10.h),
                  Text(
                    "Journal",
                    style: TextFontStyle.textStyle16cEDE3BAInter700,
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpace(16.h),
            GestureDetector(
              onTap: () {
                _navigation(Routes.overcomeScreen);
              },
              child: Row(
                children: [
                  Image.asset(
                    Assets.icons.overcome.path,
                    height: 20.h,
                    width: 20.w,
                  ),
                  UIHelper.horizontalSpace(10.h),
                  Text(
                    "Overcome",
                    style: TextFontStyle.textStyle16cEDE3BAInter700,
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpace(16.h),
            GestureDetector(
              onTap: () {
                CustomPremiumCardPopup.show(context);
              },
              child: Row(
                children: [
                  Image.asset(
                    Assets.icons.premium.path,
                    height: 20.h,
                    width: 20.w,
                  ),
                  UIHelper.horizontalSpace(10.h),
                  Text(
                    "Premium",
                    style: TextFontStyle.textStyle16cEDE3BAInter700,
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpace(16.h),
            GestureDetector(
              onTap: () {
                _navigation(Routes.settingsScreen);
              },
              child: Row(
                children: [
                  Image.asset(
                    Assets.icons.setting.path,
                    height: 20.h,
                    width: 20.w,
                  ),
                  UIHelper.horizontalSpace(10.h),
                  Text(
                    "Settings",
                    style: TextFontStyle.textStyle16cEDE3BAInter700,
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpace(16.h),
            GestureDetector(
              onTap: () {
                LogoutPopup.show(context);
              },
              child: Row(
                children: [
                  Image.asset(
                    Assets.icons.logout.path,
                    height: 20.h,
                    width: 20.w,
                  ),
                  UIHelper.horizontalSpace(10.h),
                  Text(
                    "Logout",
                    style: TextFontStyle.textStyle16cC7394BInter700,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
