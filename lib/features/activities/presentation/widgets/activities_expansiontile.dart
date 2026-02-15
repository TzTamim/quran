import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widgets/waiting_widget.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart' show AppColors;
import '../../../../helpers/loading_helper.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../networks/api_acess.dart';
import '../../../home/presentation/widgets/reward_dialog.dart';
import '../../model/activity_details_res_model.dart';

class ActivitiesExpansiontile extends StatefulWidget {
  final int activityId;
  final Color color1;
  final Color? color2;
  final String title;
  final String subtitle;
  final Widget leading;
  final Color tileColor;
  final int totalTileItems;
  final int completedIntems;

  const ActivitiesExpansiontile({
    super.key,
    required this.color1,
    this.color2,
    required this.activityId,
    required this.title,
    required this.subtitle,
    required this.leading,
    required this.tileColor,
    required this.totalTileItems,
    required this.completedIntems,
  });

  @override
  State<ActivitiesExpansiontile> createState() =>
      _ActivitiesExpansiontileState();
}

class _ActivitiesExpansiontileState extends State<ActivitiesExpansiontile> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    getActivitiesDetailsRxObj.getActivitiesDetails(widget.activityId);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getActivitiesDetailsRxObj.fileData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: WaitingWidget(),
            );
          } else if (!snapshot.hasError && snapshot.data != null) {
            ActivityDetailsResModel activityDetailsResModel =
                ActivityDetailsResModel.fromJson(snapshot.data!);
            return Container(
              width: 335.w,
              decoration: BoxDecoration(
                color: widget.color2 == null ? widget.color1 : null,
                gradient: widget.color2 != null
                    ? LinearGradient(
                        colors: [widget.color1, widget.color2!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                borderRadius: BorderRadius.circular(16.r),
                border: isExpanded
                    ? null
                    : Border.all(color: Colors.white, width: 1),
              ),
              child: ExpansionTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                tilePadding: EdgeInsets.all(8.sp),
                leading: Padding(
                    padding: EdgeInsets.all(4.sp), child: widget.leading),
                trailing: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: isExpanded
                      ? Icon(
                          Icons.keyboard_arrow_up,
                          color: AppColors.cFFFFFF,
                          size: 24.sp,
                        )
                      : Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.cFFFFFF,
                          size: 24.sp,
                        ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextFontStyle.textStyle20cFFFFFFGeorgia700,
                        ),
                        Text(
                          "${widget.completedIntems}/${widget.totalTileItems} Mastered",
                          style: TextFontStyle.textStyle12cFFFFFFInter400,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 35.h,
                          width: 32.w,
                          decoration: BoxDecoration(
                            color: AppColors.cC358C5,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Center(
                            child: Text(
                              widget.totalTileItems.toString(),
                              style: TextFontStyle.textStyle16cFFFFFFInter600
                                  .copyWith(
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                onExpansionChanged: (value) {
                  setState(() {
                    isExpanded = value;
                  });
                },
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.c9831E0, AppColors.cC52A98],
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Column(
                      children: [
                        UIHelper.verticalSpace(16.h),
                        activityDetailsResModel.data?.tasks?.isNotEmpty == true
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    activityDetailsResModel.data?.tasks?.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 8.h),
                                    child: tileContainer(
                                      color: AppColors.c953CA7,
                                      isCompleted: activityDetailsResModel.data
                                              ?.tasks?[index].isCompleted ??
                                          false,
                                      onTap: () {
                                        if (activityDetailsResModel.data
                                                ?.tasks?[index].isCompleted ==
                                            true) {
                                          return;
                                        }
                                        postActivitiesCompletedRxObj
                                            .postActivitiesCompleted(
                                                taskId: activityDetailsResModel
                                                        .data
                                                        ?.tasks?[index]
                                                        .id ??
                                                    0)
                                            .waitingForFutureWithoutBg()
                                            .then((v) {
                                          Future.delayed(
                                              const Duration(seconds: 2), () {
                                            Navigator.of(
                                                    NavigationService.context)
                                                .push(MaterialPageRoute(
                                              builder: (_) => RewardsDialog(
                                                title: widget.title,
                                                rewards: activityDetailsResModel
                                                        .data
                                                        ?.tasks?[index]
                                                        .rewardStars ??
                                                    0.0,
                                              ),
                                            ));
                                          });
                                          getActivitiesListRxObj
                                              .getActivitiesList(null);
                                          getTodaysGoalsRxObj.getTodaysGoals();
                                          getActivitiesDetailsRxObj
                                              .getActivitiesDetails(
                                                  widget.activityId);
                                        });
                                      },
                                      status: activityDetailsResModel
                                              .data?.tasks?[index].status ??
                                          "",
                                      targetCount: activityDetailsResModel.data
                                              ?.tasks?[index].targetCount ??
                                          0,
                                      title: activityDetailsResModel
                                              .data?.tasks?[index].title ??
                                          "",
                                      subtitle: activityDetailsResModel.data
                                              ?.tasks?[index].description ??
                                          "",
                                      totalCompletedTimes:
                                          activityDetailsResModel.data
                                                  ?.tasks?[index].completedCount
                                                  .toString() ??
                                              "",
                                      rating: activityDetailsResModel.data
                                              ?.tasks?[index].completedCount ??
                                          0,
                                      progress: activityDetailsResModel.data
                                              ?.tasks?[index].progressPercentage
                                              ?.toDouble() ??
                                          0,
                                    ),
                                  );
                                },
                              )
                            : const SizedBox(),
                        UIHelper.verticalSpace(16.h),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }
}

Widget tileContainer(
    {required String title,
    required String subtitle,
    required String totalCompletedTimes,
    required int rating,
    required double progress,
    required int targetCount,
    required String status,
    required Color color,
    bool hasPractice = false,
    bool isCompleted = false,
    Function()? onTap}) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(16.r),
    ),
    padding: EdgeInsets.all(12.sp),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextFontStyle.textStyle20cFFFFFFGeorgia700.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
                Text(subtitle, style: TextFontStyle.textStyle12cFFFFFFInter500),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.cB972B6,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.star, size: 16.sp, color: AppColors.cFFFFFF),
                  Text(
                    "+$rating",
                    style: TextFontStyle.textStyle16cFDE68AInter700.copyWith(
                      color: AppColors.cFFFFFF,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        UIHelper.verticalSpace(12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$totalCompletedTimes/$targetCount times",
              style: TextFontStyle.textStyle12cFFFFFFInter400,
            ),
            Text(
              "$progress%",
              style: TextFontStyle.textStyle12cFFFFFFInter500.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Container(
          height: 8.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColors.cAC63B6,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 8.h,
                  width: constraints.maxWidth * progress,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20.r),
                    ),
                    color: AppColors.cFFFFFF,
                  ),
                ),
              );
            },
          ),
        ),
        UIHelper.verticalSpace(12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 26.h,
              width: 44.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.cB972B6,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.c000000.withValues(alpha: 0.1),
                    blurRadius: 1.r,
                    spreadRadius: 1.r,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  status,
                  style: TextFontStyle.textStyle12cFFFFFFInter400,
                ),
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: hasPractice
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      height: 26.h,
                      decoration: BoxDecoration(
                        color: AppColors.cF9BA2D,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Tap to practice",
                            style: TextFontStyle.textStyle12cFFFFFFInter400,
                          ),
                          UIHelper.horizontalSpace(4.w),
                          SizedBox(
                            height: 16.h,
                            width: 16.w,
                            child: const Icon(Icons.arrow_forward,
                                color: AppColors.cFFFFFF),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: 24.h,
                      width: 24.w,
                      decoration: BoxDecoration(
                          color: AppColors.cFFFFFF
                              .withValues(alpha: !isCompleted ? 1 : 0.2),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: isCompleted
                          ? Icon(
                              Icons.check_circle,
                              color: AppColors.cDFE0E4,
                              size: 16.sp,
                            )
                          : Icon(
                              Icons.circle_outlined,
                              size: 16.sp,
                            ),
                    ),
            )
          ],
        ),
      ],
    ),
  );
}
