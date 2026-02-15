import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:rxdart/rxdart.dart';

import '../../common_widgets/custom_expansion_tile.dart';
import '../../common_widgets/waiting_widget.dart';
import '../../constants/text_font_style.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../helpers/helper_methods.dart';
import '../../helpers/ui_helpers.dart';
import '../../networks/api_acess.dart';
import '../settings/model/user_profile_res_model.dart';
import 'model/home_activites_res_model.dart';
import 'presentation/widgets/custom_appbar.dart';
import 'presentation/widgets/custom_home_button.dart';
import 'presentation/widgets/custom_home_card.dart';
import 'presentation/widgets/custom_home_summary.dart';
import 'presentation/widgets/custom_home_timer_field.dart';
import 'presentation/widgets/custom_navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getProfileRxObj.getProfile();
    getHomeActivitiesRxObj.getHomeActivities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.sp, vertical: 16.sp),
          child: const CustomAppBar(),
        ),
      ),
      drawer: const CustomNavigationDrawer(),
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
          child: StreamBuilder(
              stream: Rx.combineLatest2(
                  getProfileRxObj.fileData, getHomeActivitiesRxObj.fileData,
                  (a, b) {
                return [a, b];
              }),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: WaitingWidget());
                } else if (!snapshot.hasError && snapshot.data != null) {
                  ProfileResModel profileModel = ProfileResModel.fromJson(
                      snapshot.data![0] as Map<String, dynamic>);
                  HomeActivitiesResModel homeActivitiesResModel =
                      HomeActivitiesResModel.fromJson(
                          snapshot.data![1] as Map<String, dynamic>);
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIHelper.verticalSpace(11.h),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.cBC5A08.withValues(alpha: 0.2),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              colors: [
                                AppColors.c283140.withValues(alpha: 0.5),
                                AppColors.c283140.withValues(alpha: 0),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.sp),
                            child: Column(
                              children: [
                                Text.rich(
                                    TextSpan(children: [
                                      const TextSpan(
                                        text: "السلام عليكم",
                                      ),
                                      TextSpan(
                                        text:
                                            " ${profileModel.data?.fullName ?? ""}",
                                      )
                                    ]),
                                    style: TextFontStyle
                                        .textStyle24cFFFFFFSitka600
                                        .copyWith(fontWeight: FontWeight.bold)),
                                UIHelper.verticalSpace(4.h),
                                Text(
                                  "Sunday, November 16, 2025",
                                  style: TextFontStyle
                                      .textStyle14cFCD34DInter400
                                      .copyWith(
                                    color: AppColors.cFCD34D
                                        .withValues(alpha: 0.6),
                                  ),
                                ),
                                UIHelper.verticalSpace(16.h),
                                Container(
                                  decoration: ShapeDecoration(
                                    color: const Color(0x19BC5A08),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 0.60.w,
                                          color: AppColors.cBC5A08),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 12.sp,
                                      horizontal: 24.sp,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 24.h,
                                              width: 24.w,
                                              child: Image.asset(Assets
                                                  .icons.mingcuteAiFill.path),
                                            ),
                                            UIHelper.horizontalSpace(8.w),
                                            Text(
                                              "Free Trial: 6 days remaining",
                                              style: TextFontStyle
                                                  .textStyle16cFCD34DInter600,
                                            ),
                                          ],
                                        ),
                                        UIHelper.verticalSpace(12.h),
                                        const CustomHomeButton(),
                                      ],
                                    ),
                                  ),
                                ),
                                UIHelper.verticalSpace(16.h),
                                FittedBox(
                                  child: Text(
                                    "\"Small Consistent steps lead to great spiritual growth\"",
                                    style: TextFontStyle
                                        .textStyle12cFCD34DInter400
                                        .copyWith(fontStyle: FontStyle.italic),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        UIHelper.verticalSpace(24.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CustomHomeCard(
                                numberLabel: Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "42/",
                                      style: TextFontStyle
                                          .textStyle24cFFFFFFInter600),
                                  TextSpan(
                                      text: "99",
                                      style: TextFontStyle
                                          .textStyle16c979CA8Inter600
                                          .copyWith(
                                              color: AppColors.cFCD34D
                                                  .withValues(alpha: 0.6)))
                                ])),
                                height: 12.h,
                                width: 24.w,
                                iconPath: Assets.icons.spiritualLevel.path,
                                title: 'Spiritual Level',
                                subtitle: 'dsdd',
                                progress: 0.2,
                                isPercentIndicator: true,
                              ),
                            ),
                            UIHelper.horizontalSpace(16.w),
                            Expanded(
                              child: CustomHomeCard(
                                numberLabel: Text(
                                  "1",
                                  style:
                                      TextFontStyle.textStyle24cFFFFFFInter600,
                                ),
                                iconPath: Assets.icons.streak.path,
                                title: 'Streak',
                                subtitle: 'ddd',
                              ),
                            ),
                            UIHelper.horizontalSpace(16.w),
                            Expanded(
                              child: CustomHomeCard(
                                numberLabel: Text(
                                  "1",
                                  style:
                                      TextFontStyle.textStyle24cFFFFFFInter600,
                                ),
                                iconPath: Assets.icons.best.path,
                                title: 'Best',
                                subtitle: 'ddd',
                              ),
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(24.h),
                        SizedBox(
                          height: 24.h,
                          width: 335.w,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 24.h,
                                width: 24.w,
                                child: Image.asset(
                                  Assets.icons.openBook.path,
                                  height: 24.h,
                                  width: 24.w,
                                ),
                              ),
                              UIHelper.horizontalSpace(8.w),
                              Text(
                                "Quran Day",
                                style: TextFontStyle.textStyle16cFFFFFFInter500,
                              ),
                            ],
                          ),
                        ),
                        UIHelper.verticalSpace(8.h),
                        Text(
                          "Complete today's special focus",
                          style:
                              TextFontStyle.textStyle14cFCD34DInter400.copyWith(
                            color: AppColors.cFCD34D.withValues(alpha: 0.6),
                          ),
                        ),
                        UIHelper.verticalSpace(16.h),
                        CustomHomeTimerField(
                            initialDuration: parseDurationFromString(
                                homeActivitiesResModel.data!.timeUntilReset!)),
                        UIHelper.verticalSpace(14.h),
                        CustomExpansionTile(
                          color2: AppColors.cC126CF,
                          color1: AppColors.cE11E4A,
                          title: "dhikr",
                          subtitle: "0/1 Complete]",
                          leading: Image.asset(
                            Assets.icons.diamond.path,
                            height: 24.sp,
                            width: 24.sp,
                          ),
                          tileColor: AppColors.cA22174,
                          tileTitle: 'Make Dua',
                          tileSubtitle: 'Ask Allah for what you need',
                          index: 0,
                        ),
                        UIHelper.verticalSpace(16.h),
                        CustomExpansionTile(
                          color1: AppColors.c0A957B,
                          title: "Quran",
                          subtitle: "0/1 Complete]",
                          leading: Image.asset(
                            Assets.icons.openBook.path,
                            height: 24.sp,
                            width: 24.sp,
                          ),
                          tileColor: AppColors.c06775C,
                          tileTitle: 'Read Quran',
                          tileSubtitle: 'Read at least one page of Quran today',
                          index: 1,
                        ),
                        UIHelper.verticalSpace(16.h),
                        CustomExpansionTile(
                          color1: AppColors.cE16909,
                          title: "Learning",
                          subtitle: "0/1 Complete]",
                          leading: Image.asset(
                            Assets.icons.closedBook.path,
                            height: 24.sp,
                            width: 24.sp,
                          ),
                          tileColor: AppColors.cBA4709,
                          tileTitle: 'Learn Something Islamic',
                          tileSubtitle: 'Read a health or Islamic article',
                          index: 2,
                        ),
                        UIHelper.verticalSpace(16.h),
                        CustomExpansionTile(
                          color1: AppColors.c3856E8,
                          title: "Prayer",
                          subtitle: "0/1 Complete]",
                          leading: Image.asset(
                            Assets.icons.prayerHand.path,
                            height: 24.sp,
                            width: 24.sp,
                          ),
                          tileColor: AppColors.c373EB8,
                          tileTitle: '5 Daily Prayers',
                          tileSubtitle:
                              'Complete all 5 obligatory prayers today',
                          index: 3,
                        ),
                        UIHelper.verticalSpace(24.h),
                        const CustomHomeSummary(),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: WaitingWidget(),
                );
              }),
        ),
      ),
    );
  }
}
