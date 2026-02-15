import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/text_font_style.dart';
import '../features/home/presentation/widgets/reward_dialog.dart';
import '../gen/colors.gen.dart';
import '../helpers/navigation_service.dart';
import '../helpers/ui_helpers.dart';

class CustomExpansionTile extends StatefulWidget {
  final Color color1;
  final Color? color2;
  final String title;
  final String subtitle;
  final Widget leading;
  final Color tileColor;
  final String tileTitle;
  final String tileSubtitle;
  final int index;

  const CustomExpansionTile({
    super.key,
    required this.color1,
    this.color2,
    required this.title,
    required this.subtitle,
    required this.leading,
    required this.tileColor,
    required this.tileTitle,
    required this.tileSubtitle,
    required this.index,
  });

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool isExpanded = false;
  bool isMarkAsDone = false;
  List<Color> colors = [
    AppColors.c0891B0,
    AppColors.c0891B0,
    AppColors.c978824,
    AppColors.c0790B3,
  ];
  @override
  Widget build(BuildContext context) {
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
        borderRadius: BorderRadius.circular(16),
        border: isExpanded ? null : Border.all(color: Colors.white, width: 1),
      ),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        tilePadding: EdgeInsets.all(8.sp),
        leading: widget.leading,
        trailing: SizedBox(
          width: 100.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("0%", style: TextFontStyle.textStyle24cFFFFFFInter600),
              UIHelper.horizontalSpace(4.w),
              isExpanded
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
            ],
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: TextFontStyle.textStyle20cFFFFFFGeorgia700,
            ),
          ],
        ),
        subtitle: Text(
          widget.subtitle,
          style: TextFontStyle.textStyle12cFFFFFFInter400,
        ),
        onExpansionChanged: (value) {
          setState(() {
            isExpanded = value;
          });
        },
        children: <Widget>[
          GestureDetector(
            onTap: () {
              // if (isMarkAsDone == false) {
              //   return;
              // }
              // Navigator.push(
              //   NavigationService.context,
              //   MaterialPageRoute(
              //     builder: (_) => HomeScreenSubtab(
              //       title: widget.tileTitle,
              //       index: widget.index,
              //       color1: widget.color1,
              //       color2: widget.color2 ?? colors[widget.index],
              //     ),
              //   ),
              // );
            },
            child: Container(
              decoration: BoxDecoration(color: widget.tileColor),
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.cC1C4CC, width: 1),
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.cFFFFFF.withValues(alpha: 0.1),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.sp,
                    horizontal: 16.sp,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 152.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.tileTitle,
                              style: TextFontStyle.textStyle18cFFFFFFGeorgia400
                                  .copyWith(
                                decoration: isMarkAsDone
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                decorationColor: AppColors.cFFFFFF,
                              ),
                            ),
                            UIHelper.verticalSpace(4.h),
                            Text(
                              widget.tileSubtitle,
                              style: TextFontStyle.textStyle12cFFFFFFInter400,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 24.h,
                        width: 67.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.cFFFFFF.withValues(alpha: 0.1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.sp),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 16.h,
                                width: 16.w,
                                child: Icon(
                                  Icons.star,
                                  color: AppColors.cFFFFFF,
                                  size: 12.sp,
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  "+0.5",
                                  style:
                                      TextFontStyle.textStyle14cFFFFFFInter500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      UIHelper.horizontalSpace(8.w),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isMarkAsDone = !isMarkAsDone;
                          });
                          Future.delayed(const Duration(seconds: 2), () {
                            if (isMarkAsDone == false) {
                              return;
                            }
                            Navigator.of(NavigationService.context)
                                .push(MaterialPageRoute(
                              builder: (_) => RewardsDialog(
                                title: widget.tileTitle,
                                rewards: 0.5,
                                color1: widget.color1,
                                color2: widget.color2 ?? colors[widget.index],
                              ),
                            ));
                          });
                        },
                        child: Container(
                          height: 24.h,
                          width: 24.w,
                          decoration: BoxDecoration(
                              color: AppColors.cFFFFFF
                                  .withValues(alpha: !isMarkAsDone ? 1 : 0.2),
                              borderRadius: BorderRadius.circular(4.r)),
                          child: isMarkAsDone
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
