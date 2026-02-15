import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/text_font_style.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/di.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';
import '../model/onbording_model.dart';
import '../provider/onbording_provider.dart';
import 'widgets/arrow_right_button.dart';
import 'widgets/onbording_dot_builder.dart';
import 'widgets/skip_button.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
          child: Consumer<OnbordingProvider>(
            builder: (context, provider, _) {
              return Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: skipButton(() {
                      appData.write(kKeyfirstTime, false);
                      NavigationService.navigateToReplacement(
                          Routes.signInScreen);
                    }),
                  ),
                  UIHelper.verticalSpace(40.h),
                  Expanded(
                    flex: 5,
                    child: PageView.builder(
                      controller: provider.pageController,
                      onPageChanged: (index) {
                        provider.currentIndex = index;
                      },
                      itemCount: onbordingList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          onbordingList[index].image,
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
                  UIHelper.verticalSpace(32.h),
                  onboringDotBuilder(context),
                  UIHelper.verticalSpace(48.h),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text(
                            onbordingList[provider.currentIndex].title,
                            textAlign: TextAlign.center,
                            style: TextFontStyle.textStyle24cFFFFFFGeorgia900,
                          ),
                          UIHelper.verticalSpace(16.h),
                          Text(
                            onbordingList[provider.currentIndex].description,
                            textAlign: TextAlign.center,
                            style: TextFontStyle.textStyle12cFFFFFFInter400,
                          ),
                        ],
                      )),
                  arrowRightButton(
                    onTap: () {
                      if (provider.currentIndex < onbordingList.length - 1) {
                        provider.pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        appData.write(kKeyfirstTime, false);
                        NavigationService.navigateToReplacement(
                            Routes.signInScreen);
                      }
                    },
                  ),
                  UIHelper.verticalSpace(40.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
