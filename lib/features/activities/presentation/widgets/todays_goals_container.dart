import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/loading_helper.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../networks/api_acess.dart';
import '../../../../networks/endpoints.dart';
import '../../../home/presentation/widgets/reward_dialog.dart';

class GoalsContainer extends StatefulWidget {
  final int taskId;
  final String title;
  final String iconPath;
  final Color backgroundColor;
  final String earnPoints;
  final bool isSelected;

  const GoalsContainer(
      {super.key,
      required this.taskId,
      required this.isSelected,
      required this.title,
      required this.iconPath,
      required this.backgroundColor,
      required this.earnPoints});

  @override
  State<GoalsContainer> createState() => _GoalsContainerState();
}

class _GoalsContainerState extends State<GoalsContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isSelected) {
          return;
        }
        postActivitiesCompletedRxObj
            .postActivitiesCompleted(taskId: widget.taskId)
            .waitingForFutureWithoutBg()
            .then((v) {
          if (v) {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(NavigationService.context).push(MaterialPageRoute(
                builder: (_) => RewardsDialog(
                  title: widget.title,
                  rewards: double.parse(widget.earnPoints),
                ),
              ));
            });
            getTodaysGoalsRxObj.getTodaysGoals();
            getActivitiesListRxObj.getActivitiesList(null);
          }
        });
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(11.5.w, 10.h, 11.5.w, 4.h),
        height: 90.h,
        width: 100.w,
        decoration: widget.isSelected
            ? BoxDecoration(
                color: AppColors.c1E3435,
                border: Border.all(color: AppColors.c0A957B),
                borderRadius: BorderRadius.circular(8.r),
              )
            : BoxDecoration(
                color: AppColors.c262028,
                border: Border.all(color: AppColors.c4B352C),
                borderRadius: BorderRadius.circular(8.r),
              ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.isSelected
                ? Container(
                    height: 32.h,
                    width: 32.w,
                    padding: EdgeInsets.all(8.sp),
                    decoration: const BoxDecoration(
                      color: AppColors.c0A957B,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(Assets.icons.done.path),
                  )
                : Container(
                    height: 32.h,
                    width: 32.w,
                    padding: EdgeInsets.all(8.sp),
                    decoration: BoxDecoration(
                      color: widget.backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Image.network("$baseUrl${widget.iconPath}")),
            UIHelper.verticalSpace(4.h),
            widget.isSelected
                ? FittedBox(
                    child: Text(
                      widget.title,
                      style: TextFontStyle.textStyle14c17202DInter600.copyWith(
                        color: AppColors.c0A957B,
                        fontSize: 10.sp,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.c0A957B,
                      ),
                    ),
                  )
                : FittedBox(
                    child: Text(
                      widget.title,
                      style: TextFontStyle.textStyle14c17202DInter600.copyWith(
                        color: AppColors.cEDE3BA,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.icons.star.path,
                  height: 16.h,
                  width: 16.w,
                ),
                UIHelper.horizontalSpace(4.w),
                FittedBox(
                  child: Text(
                    widget.earnPoints,
                    style: TextFontStyle.textStyle16cEDE3BAInter700.copyWith(
                      color: AppColors.cFCD34D,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
