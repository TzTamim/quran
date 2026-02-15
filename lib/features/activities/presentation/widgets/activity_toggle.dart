import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../networks/api_acess.dart';
import '../../model/activites_list_res_model.dart';
import 'activities_expansiontile.dart';

class ActivityToggle extends StatefulWidget {
  final ActivityListResModel activityListResModel;
  final Function onToggleTap;
  const ActivityToggle({
    super.key,
    required this.onToggleTap,
    required this.activityListResModel,
  });

  @override
  State<ActivityToggle> createState() => _ActivityToggleState();
}

class _ActivityToggleState extends State<ActivityToggle> {
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<bool> _isExpand = ValueNotifier(false);

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _isExpand.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (_isExpand.value == false) {
            widget.onToggleTap();
          }
          _isExpand.value = !_isExpand.value;
        },
        child: ValueListenableBuilder(
            valueListenable: _isExpand,
            builder: (context, value, child) {
              return Column(children: [
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.c17202D,
                    border: Border.all(color: AppColors.c4B352C),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _isExpand.value
                            ? Icons.keyboard_arrow_up_outlined
                            : Icons.keyboard_arrow_down_outlined,
                        size: 20.sp,
                        color: AppColors.cEDE3BA,
                      ),
                      UIHelper.horizontalSpace(20.w),
                      Text(
                        _isExpand.value
                            ? 'Hide All Activities Library'
                            : 'View All Activities Library',
                        style: TextFontStyle.textStyle14c17202DInter600
                            .copyWith(color: AppColors.cEDE3BA),
                      ),
                    ],
                  ),
                ),
                if (_isExpand.value)
                  Column(
                    children: [
                      UIHelper.verticalSpace(16.h),
                      searchField(_searchController),
                      UIHelper.verticalSpace(16.h),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.activityListResModel.data!.length,
                          itemBuilder: (context, index) {
                            var activity =
                                widget.activityListResModel.data![index];
                            return GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: index ==
                                            widget.activityListResModel.data!
                                                    .length -
                                                1
                                        ? 0.h
                                        : 16),
                                child: ActivitiesExpansiontile(
                                  activityId: activity.id!,
                                  color1: AppColors.c9831E0,
                                  color2: AppColors.cC52A98,
                                  title: activity.name ?? "",
                                  subtitle:
                                      "${activity.totalTasks}/${activity.masteredTasks} Mastered",
                                  leading: const Icon(Icons.diamond_outlined),
                                  tileColor: AppColors.c9532E6,
                                  totalTileItems: activity.totalTasks ?? 0,
                                  completedIntems: activity.masteredTasks ?? 0,
                                ),
                              ),
                            );
                          })
                    ],
                  )
              ]);
            }));
  }
}

Widget searchField(TextEditingController searchController) {
  return Container(
    height: 40.h,
    decoration: BoxDecoration(
      color: AppColors.c1B2638,
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: AppColors.c4B352C),
    ),
    child: TextFormField(
      onChanged: (v) {
        getActivitiesListRxObj.getActivitiesList(v.trim());
        log("====>$v");
      },
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
          child: Icon(Icons.search, color: AppColors.cF9BA2D, size: 20.sp),
        ),
      ),
    ),
  );
}
