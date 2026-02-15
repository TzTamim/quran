import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class ReflectionScreenSubtab extends StatefulWidget {
  const ReflectionScreenSubtab({super.key});

  @override
  State<ReflectionScreenSubtab> createState() => _ReflectionScreenSubtabState();
}

class _ReflectionScreenSubtabState extends State<ReflectionScreenSubtab> {
  final TextEditingController _reflectionController = TextEditingController();
  int selectedIndex = -1;
  @override
  void dispose() {
    _reflectionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "Grateful",
      "Peaceful",
      "Energized",
      "Contemplative",
      "Hopeful",
    ];

    return Scaffold(
      backgroundColor: AppColors.c17202D,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20.sp),
            width: 338.w,
            height: 660.h,
            decoration: BoxDecoration(
              color: AppColors.cBC5A08.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.cBC5A08, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Reflect on your experience",
                      style: TextFontStyle.textStyle24cFFFFFFSitka600,
                    ),
                    SizedBox(
                        height: 24.h, width: 24.w, child: const Placeholder()),
                  ],
                ),
                UIHelper.verticalSpace(16.h),
                Text(
                  "How did completing “5 daily Prayers” make you feel?",
                  style: TextFontStyle.textStyle14cFFFFFFInter500,
                ),
                UIHelper.verticalSpace(24.h),
                Text(
                  "Select your mood",
                  style: TextFontStyle.textStyle16cFFFFFFInter500,
                ),
                UIHelper.verticalSpace(16.h),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: List.generate(
                    titles.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: customContainer(
                        titles[index],
                        selectedIndex == index,
                      ),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(24.h),
                Text(
                  "Your Reflection",
                  style: TextFontStyle.textStyle16cFCD34DInter500,
                ),
                UIHelper.verticalSpace(8.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.sp,
                    horizontal: 16.sp,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.c798090),
                  ),
                  child: TextField(
                    cursorColor: AppColors.cEDE3BA,
                    style: const TextStyle(color: AppColors.cEDE3BA),
                    controller: _reflectionController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText:
                          'Share your thoughts, insights, or gratitude...',
                      hintStyle: TextFontStyle.textStyle14cEDE3BAInter400,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                Row(
                  children: [
                    Expanded(
                      child: customButton(
                        AppColors.cFFFFFF,
                        Colors.transparent,
                        Colors.transparent,
                        "Skip",
                      ),
                    ),
                    UIHelper.horizontalSpace(16.w),
                    Expanded(
                      child: customButton(
                        Colors.transparent,
                        AppColors.cD87606,
                        AppColors.cBC5A08,
                        "Save reflection",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget customContainer(String title, bool isSelected) {
  return Container(
    height: 80.h,
    width: 108.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: isSelected
          ? AppColors.cE16909
          : AppColors.cFFFFFF.withValues(alpha: 0.05),
      border: Border.all(
        color: isSelected ? AppColors.cE16909 : AppColors.cDFE0E4,
        width: 1,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 32.h, width: 32.w, child: const Placeholder()),
        SizedBox(height: 8.h),
        Text(
          title,
          style: TextFontStyle.textStyle12cFFFFFFInter500.copyWith(
            color: isSelected ? Colors.white : AppColors.cFFFFFF,
          ),
        ),
      ],
    ),
  );
}

Widget customButton(
  Color borderColor,
  Color color1,
  Color? color2,
  String label,
) {
  return Container(
    alignment: Alignment.center,
    height: 36.h,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [color1, color2 ?? color1]),
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: borderColor),
    ),
    child: Text(label, style: TextFontStyle.textStyle14cFFFFFFInter500),
  );
}
