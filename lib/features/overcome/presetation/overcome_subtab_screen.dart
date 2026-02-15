import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';

import '../../../common_widgets/common_back_arrow.dart';
import '../../../common_widgets/waiting_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../networks/api_acess.dart';
import '../model/triggers_res_model.dart';
import 'widgets/set_up_recovery_journey_card.dart';

class OvercomeSubtabScreen extends StatefulWidget {
  const OvercomeSubtabScreen({super.key});

  @override
  State<OvercomeSubtabScreen> createState() => _OvercomeSubtabScreenState();
}

class _OvercomeSubtabScreenState extends State<OvercomeSubtabScreen> {
  @override
  void initState() {
    super.initState();
    getTriggersListRxObj.getTriggersList();
    getStrategiesListRxObj.getStrategiesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 200.w,
        leading: Padding(
          padding: EdgeInsets.only(left: UIHelper.kDefaulutPadding()),
          child: const CommonBackArrowWidget(),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder(
            stream: Rx.combineLatest2(getTriggersListRxObj.fileData,
                getStrategiesListRxObj.fileData, (a, b) => [a, b]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: WaitingWidget(),
                );
              } else if (!snapshot.hasError && snapshot.data != null) {
                List<TriggesResModel> triggersList =
                    triggesResModelFromJson(json.encode(snapshot.data![0]));
                List<TriggesResModel> strategiesList =
                    triggesResModelFromJson(json.encode(snapshot.data![1]));
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        UIHelper.verticalSpace(24.h),
                        Container(
                          padding: EdgeInsets.all(16.w),
                          height: 325.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.c1B2638,
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(color: AppColors.c4B352C),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                Assets.icons.privacyIconColorfull.path,
                                height: 60.h,
                                width: 60.w,
                              ),
                              UIHelper.verticalSpace(12.h),
                              SizedBox(
                                height: 84.h,
                                width: 202.w,
                                child: Text(
                                  "Overcome &\nFind Peace",
                                  textAlign: TextAlign.center,
                                  style: TextFontStyle
                                      .textStyle32cF9BA2DGeorgia700,
                                ),
                              ),
                              UIHelper.verticalSpace(16.h),
                              SizedBox(
                                height: 48.h,
                                width: 260.w,
                                child: Text(
                                  "Comprehensive support for your\nrecovery journey",
                                  textAlign: TextAlign.center,
                                  style: TextFontStyle
                                      .textStyle16c798090Inter500
                                      .copyWith(color: AppColors.cAFA26B),
                                ),
                              ),
                              UIHelper.verticalSpace(12.h),
                              SizedBox(
                                height: 58.h,
                                width: 260.w,
                                child: Text(
                                  "  Indeed, Allah loves those who are\nconstantly\nrepentant\" - Quran 2:222",
                                  textAlign: TextAlign.center,
                                  style: TextFontStyle
                                      .textStyle14cCFA128Inter500
                                      .copyWith(color: AppColors.cD08D06),
                                ),
                              ),
                            ],
                          ),
                        ),
                        UIHelper.verticalSpace(16.h),
                        SetUpRecoveryJourneyCard(
                          strategies: strategiesList,
                          triggers: triggersList,
                        ),
                        UIHelper.verticalSpace(16.h),
                        Container(
                          height: 282.h,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 16.sp,
                            horizontal: 14.sp,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.c0A957B,
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                Assets.icons.heartIcon.path,
                                height: 60.h,
                                width: 60.w,
                              ),
                              UIHelper.verticalSpace(12.h),
                              Text(
                                "You Are Not Alone",
                                style: TextFontStyle.textStyle24cF9BA2DInter700
                                    .copyWith(color: AppColors.cFFFFFF),
                              ),
                              UIHelper.verticalSpace(12.h),
                              Text(
                                "Every day you resist is a victory. Every\nmoment of tawbah is accepted by Allah.\nHe is waiting for you with open arms of\nmercy.",
                                textAlign: TextAlign.center,
                                style: TextFontStyle.textStyle16c798090Inter500
                                    .copyWith(
                                  color: AppColors.cFFFFFF,
                                  fontSize: 14.sp,
                                ),
                              ),
                              UIHelper.verticalSpace(12.h),
                              SizedBox(
                                height: 42.h,
                                width: 275.w,
                                child: Text(
                                  "Indeed, my Lord is near and responsive\"\n Quran 11:61",
                                  textAlign: TextAlign.center,
                                  style: TextFontStyle
                                      .textStyle14cFFFFFFInter500
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Text("Something went wrong");
              }
            }),
      ),
    );
  }
}

Widget triggerTypesContiner(String title) {
  return Container(
    padding: EdgeInsets.all(10.sp),
    decoration: BoxDecoration(
      color: AppColors.c17202D,
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: AppColors.c4B352C, width: 0.4),
    ),
    child: Text(
      title,
      style: TextFontStyle.textStyle14cAFA26BInter700.copyWith(
        color: AppColors.cFDE68A,
      ),
    ),
  );
}

Widget selectedTriggerTypesContiner(String title) {
  return Container(
    padding: EdgeInsets.all(10.w),
    decoration: BoxDecoration(
      gradient: const LinearGradient(colors: [
        AppColors.cD87606,
        AppColors.cBC5A08,
      ]),
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: AppColors.c4B352C, width: 0.4),
    ),
    child: Text(title,
        style: TextFontStyle.textStyle14cAFA26BInter700.copyWith(
          color: AppColors.c17202D,
        )),
  );
}
