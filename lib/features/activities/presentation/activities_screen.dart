import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:rxdart/rxdart.dart';
import '../../../common_widgets/waiting_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/helper_methods.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../networks/api_acess.dart';
import '../model/activites_list_res_model.dart';
import '../model/todays_goals_res_model.dart';
import 'widgets/activity_toggle.dart';
import 'widgets/todays_goals_container.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  final TextEditingController _searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  bool isShowExpanded = false;
  @override
  initState() {
    super.initState();
    getActivitiesListRxObj.getActivitiesList(null);
    getTodaysGoalsRxObj.getTodaysGoals();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: StreamBuilder(
              stream: Rx.combineLatest2(
                  getActivitiesListRxObj.fileData, getTodaysGoalsRxObj.fileData,
                  (activitiesData, goalsData) {
                return {
                  'activitiesData': activitiesData,
                  'goalsData': goalsData,
                };
              }),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: WaitingWidget());
                } else if (!snapshot.hasError && snapshot.data != null) {
                  ActivityListResModel activityListResModel =
                      ActivityListResModel.fromJson(
                          snapshot.data!['activitiesData']);
                  TodaysGoalsResModel goalsModel =
                      TodaysGoalsResModel.fromJson(snapshot.data!['goalsData']);
                  return CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            UIHelper.verticalSpace(12.h),
                            activitiesContainer(),
                            UIHelper.verticalSpace(16.h),
                            goalsListContainer(goalsModel),
                            UIHelper.verticalSpace(16.h),
                            ActivityToggle(
                                activityListResModel: activityListResModel,
                                onToggleTap: () {
                                  scrollController.animateTo(
                                    scrollController.position.maxScrollExtent,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                }),
                            UIHelper.verticalSpace(16.h),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: WaitingWidget(),
                  );
                }
              }),
        ),
      ),
    );
  }
}

Widget activitiesContainer() {
  return Container(
    height: 86.h,
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
    decoration: BoxDecoration(
      color: AppColors.c1B2638,
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(color: AppColors.c4B352C),
    ),
    child: Row(
      children: [
        Image.asset(
          Assets.icons.activities.path,
          height: 32.h,
          width: 32.w,
        ),
        UIHelper.horizontalSpace(8.w),
        Expanded(
          child: SizedBox(
            height: 52.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                  child: Text(
                    "Activities",
                    style: TextFontStyle.textStyle20cFFFFFFGeorgia700.copyWith(
                      color: AppColors.cEDE3BA,
                    ),
                  ),
                ),
                UIHelper.verticalSpace(3.h),
                SizedBox(
                  height: 18.h,
                  child: Text(
                    "Stay consistent, grow daily",
                    style: TextFontStyle.textStyle12cFFFFFFInter500.copyWith(
                      color: AppColors.cAFA26B,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        UIHelper.horizontalSpace(4.w),
        activitySmallBox(
          title: "Done",
          value: "8",
          titleColor: AppColors.c0A957B,
          valueColor: AppColors.c16D3B0,
          icon: Image.asset(
            Assets.icons.readingProgress.path,
            height: 24.h,
            width: 24.w,
            color: AppColors.c0A957B,
          ),
          containerColor1: AppColors.c162B36,
          containerColor2: AppColors.c162B36,
        ),
        UIHelper.horizontalSpace(4.w),
        activitySmallBox(
          title: "Done",
          value: "8",
          titleColor: AppColors.cF9BA2D,
          valueColor: AppColors.cF9BA2D,
          icon: Image.asset(
            Assets.icons.spiritualLevel.path,
            height: 24.h,
            width: 24.w,
            color: AppColors.cF9BA2D,
          ),
          containerColor1: AppColors.cBC5A08.withValues(alpha: 0.24),
          containerColor2: AppColors.cBC5A08.withAlpha(0),
        ),
      ],
    ),
  );
}

Widget goalsListContainer(TodaysGoalsResModel goalsModel) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AppColors.cBC5A08.withValues(alpha: 0.5),
          AppColors.cBC5A08.withValues(alpha: 0),
        ],
      ),
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(color: AppColors.cBC5A08.withValues(alpha: 0.5)),
    ),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(9.5.sp),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(6.5.sp),
                child: Row(
                  children: [
                    Image.asset(
                      Assets.icons.todaysGoals.path,
                      height: 20.h,
                      width: 20.w,
                    ),
                    UIHelper.horizontalSpace(8.w),
                    Text(
                      "Today’s Goals",
                      style: TextFontStyle.textStyle20cFFFFFFGeorgia700
                          .copyWith(color: AppColors.cEDE3BA),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${goalsModel.data!.completed}/${goalsModel.data!.totalGoals}",
                          style: TextFontStyle.textStyle20cEDE3BAInter700
                              .copyWith(color: AppColors.cF9BA2D),
                        ),
                        Text(
                          "Completed",
                          style: TextFontStyle.textStyle12c00AF3AInter400
                              .copyWith(color: AppColors.cAFA26B),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpace(6.5.h),
              Wrap(
                spacing: 6.w,
                runSpacing: 8.h,
                children: List.generate(
                    goalsModel.data!.goals!.length,
                    (index) => GoalsContainer(
                          taskId: goalsModel.data!.goals![index].id!,
                          isSelected:
                              goalsModel.data!.goals![index].isCompleted!,
                          title: goalsModel.data!.goals![index].title ?? "",
                          iconPath: goalsModel.data!.goals![index].icon ?? "",
                          backgroundColor: hexToColor(
                              goalsModel.data!.goals![index].iconBgColor ?? ""),
                          earnPoints:
                              goalsModel.data!.goals![index].rewardStars ?? "",
                        )),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget activitySmallBox({
  required String title,
  required String value,
  required Color titleColor,
  required Color valueColor,
  required Widget icon,
  required Color containerColor1,
  required Color containerColor2,
}) {
  return Container(
    height: 48.h,
    width: 54.w,
    padding: EdgeInsets.fromLTRB(6.w, 10.h, 4.w, 0.h),
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [containerColor1, containerColor2]),
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(
        color: AppColors.c0A957B.withValues(alpha: 0.5),
        width: 0.6.w,
      ),
    ),
    child: Column(
      children: [
        Row(
          children: [
            SizedBox(height: 12.h, width: 12.w, child: icon),
            UIHelper.horizontalSpace(3.w),
            Text(
              title,
              style: TextFontStyle.textStyle12c00AF3AInter400.copyWith(
                color: titleColor,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
        UIHelper.verticalSpace(4.h),
        Text(
          value,
          style: TextFontStyle.textStyle12cFCD34DInter600.copyWith(
            color: valueColor,
          ),
        ),
      ],
    ),
  );
}

Widget searchField(TextEditingController searchController) {
  return Container(
    height: 40.h,
    width: 335.w,
    decoration: BoxDecoration(
      color: AppColors.c1B2638,
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: AppColors.c4B352C),
    ),
    child: TextFormField(
      onChanged: (value) {},
      controller: searchController,
      cursorColor: AppColors.cAFA26B,
      style: const TextStyle(color: AppColors.cAFA26B),
      decoration: InputDecoration(
        hintText: 'Search all activites...',
        hintStyle: TextFontStyle.textStyle14cBA9941Inter400.copyWith(
          color: AppColors.cAFA26B,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.c4B352C),
        ),
        prefixIcon: Container(
          padding: EdgeInsets.symmetric(vertical: 9.5.h, horizontal: 12.w),
          height: 20.h,
          width: 20.w,
          child: const Icon(Icons.search, color: AppColors.cF9BA2D),
        ),
      ),
    ),
  );
}
