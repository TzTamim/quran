import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';
import 'all_page_screen.dart';
import 'red_page_screen.dart';
import 'unred_page_screen.dart';

class CustomNotificationPopup {
  static void show(BuildContext context) {
    final PageController pageController = PageController();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          child: Container(
            height: 720.h,
            width: 335.w,
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 32.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.cFAFAFB,
            ),
            child: Column(
              children: [
                // Page Indicator
                // SmoothPageIndicator(
                //   controller: pageController,
                //   count: 3,
                //   onDotClicked: (index) => pageController.animateToPage(
                //     index,
                //     duration: Duration(milliseconds: 300),
                //     curve: Curves.easeInOut,
                //   ),
                //   effect: WormEffect(
                //     spacing: 30,
                //     dotWidth: 48,
                //     dotHeight: 4,
                //     dotColor: Colors.grey.shade400,
                //     activeDotColor: AppColors.c17202D,
                //   ),
                // ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: WormEffect(
                        spacing: 64,
                        dotWidth: 64.w,
                        dotHeight: 2.h,
                        dotColor: AppColors.cFAFAFB,
                        activeDotColor: AppColors.c17202D,
                      ),
                    ),

                    // Text overlay
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              UIHelper.horizontalSpace(10.h),
                              GestureDetector(
                                onTap: () {
                                  pageController.animateToPage(
                                    0,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.bounceInOut,
                                  );
                                },
                                child: Text(
                                  "All",
                                  style:
                                      TextFontStyle.textStyle16c17202DInter500,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          UIHelper.horizontalSpace(64),
                          Row(
                            children: [
                              UIHelper.horizontalSpace(4.h),
                              GestureDetector(
                                onTap: () {
                                  pageController.animateToPage(
                                    1,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.bounceInOut,
                                  );
                                },
                                child: Text(
                                  "Unread",
                                  style:
                                      TextFontStyle.textStyle16c17202DInter500,
                                ),
                              ),
                            ],
                          ),
                          UIHelper.horizontalSpace(64),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  pageController.animateToPage(
                                    2,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.bounceInOut,
                                  );
                                },
                                child: Text(
                                  "Red",
                                  style:
                                      TextFontStyle.textStyle16c17202DInter500,
                                ),
                              ),
                              UIHelper.horizontalSpace(8.h),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // PageView
                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: const [
                      AllPageScreen(),
                      UnredPageScreen(),
                      RedPageScreen(),
                    ],
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
