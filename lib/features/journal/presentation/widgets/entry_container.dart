import 'package:flutter/cupertino.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class EntryContainer extends StatelessWidget {
  final String title;
  final Color containerColor;
  final Color textcolor;
  final String? description;
  final String createdAt;
  final Function() onDelete;
  const EntryContainer({
    super.key,
    required this.title,
    required this.containerColor,
    required this.textcolor,
    required this.createdAt,
    this.description,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.c1B2638,
        border: Border.all(color: AppColors.c4B352C),
      ),
      child: Column(
        children: [
          description != null
              ? Row(
                  children: [
                    const Icon(CupertinoIcons.calendar,
                        color: AppColors.cAFA26B),
                    UIHelper.horizontalSpace(10.w),
                    Text(
                      createdAt,
                      style: TextFontStyle.textStyle16cFCD34DInter500.copyWith(
                        color: AppColors.cAFA26B,
                      ),
                    ),
                    UIHelper.horizontalSpace(8.w),
                    container(title, textcolor, containerColor),
                    const Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: onDelete,
                      child: SizedBox(
                        height: 16.h,
                        width: 16.w,
                        child: const Icon(
                          CupertinoIcons.delete,
                          color: AppColors.cF87171,
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 17.79.h,
                      width: 20.w,
                      child: const Icon(
                        CupertinoIcons.heart,
                        color: AppColors.cEB70B1,
                      ),
                    ),
                    GestureDetector(
                      onTap: onDelete,
                      child: SizedBox(
                        height: 16.h,
                        width: 16.w,
                        child: const Icon(
                          CupertinoIcons.delete,
                          color: AppColors.cF87171,
                        ),
                      ),
                    ),
                  ],
                ),
          UIHelper.verticalSpace(16),
          description != null
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    description ?? '',
                    style: TextFontStyle.textStyle14cCFA128Inter500.copyWith(
                      color: AppColors.cEDE3BA,
                    ),
                  ),
                )
              : Row(
                  children: [
                    const Icon(CupertinoIcons.calendar,
                        color: AppColors.cAFA26B),
                    UIHelper.horizontalSpace(10.w),
                    Text(
                      createdAt,
                      style: TextFontStyle.textStyle16cFCD34DInter500.copyWith(
                        color: AppColors.cAFA26B,
                      ),
                    ),
                    UIHelper.horizontalSpace(8.w),
                    container(title, textcolor, containerColor),
                  ],
                ),
        ],
      ),
    );
  }
}

Widget container(String title, Color textcolor, Color containerColor) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
    decoration: BoxDecoration(
      color: containerColor,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      title,
      style: TextFontStyle.textStyle16c798090Inter500.copyWith(
        color: textcolor,
      ),
    ),
  );
}
