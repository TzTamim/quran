import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';
import 'widgets/tasbih_counter_container.dart';

class DhikrScreen extends StatefulWidget {
  const DhikrScreen({super.key});

  @override
  State<DhikrScreen> createState() => _DhikrScreenState();
}

class _DhikrScreenState extends State<DhikrScreen> {
  int selectedIndex = 1;
  String selectedArabic = "سبحان الله";
  String selectedEnglish = "SubhanAllah";
  late Color selectedColor;
  int counter = 0;

  final tasbihList = [
    {"arabic": "سبحان الله", "english": "SubhanAllah"},
    {"arabic": "الحمد لله", "english": "Alhamdulillah"},
    {"arabic": "الله أكبر", "english": "Allahu Akbar"},
    {"arabic": "الله أكبر", "english": "Allahu Akbar"},
    {"arabic": "الله أكبر", "english": "Allahu Akbar"},
  ];

  List<Color> color = [
    AppColors.c3856E8,
    AppColors.c0A957B,
    AppColors.c4B352C,
    AppColors.cE16909,
    AppColors.c00264D,
  ];
  @override
  void initState() {
    super.initState();
    selectedColor = color[selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 21.sp,
                    vertical: 16.sp,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.c17202D,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.c4B352C),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Digital Tasbih',
                        style: TextFontStyle.textStyle32cF9BA2DGeorgia700,
                      ),
                      UIHelper.verticalSpace(12.h),
                      Text(
                        'Count your dhikr with ease and track your progress',
                        style:
                            TextFontStyle.textStyle12cFFFFFFInter500.copyWith(
                          color: AppColors.cAFA26B,
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 8 / 4,
                    crossAxisSpacing: 16.w,
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.h,
                  ),
                  itemCount: tasbihList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        counter = 0;
                        setState(() {
                          selectedIndex = index;
                          selectedArabic = tasbihList[index]["arabic"]!;
                          selectedEnglish = tasbihList[index]["english"]!;
                          selectedColor = color[index];
                        });
                      },
                      child: tasbihContainer(
                        tasbihList[index]["arabic"]!,
                        tasbihList[index]["english"]!,
                        selectedIndex == index,
                        color[selectedIndex],
                      ),
                    );
                  },
                ),
                UIHelper.verticalSpace(16.h),
                TasbihCounterContainer(
                    arabic: selectedArabic,
                    englishMeaning: selectedEnglish,
                    color: selectedColor,
                    counter: counter,
                    onTap: (counter) {
                      setState(() {
                        this.counter++;
                      });
                    }),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.sp,
                    horizontal: 15.5.sp,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "\"Those who remember Allah standing, sitting,\n   and lying on their sides, and reflect on the\n      creation of the heavens and the earth\".",
                        style: TextFontStyle.textStyle12cFFFFFFInter500
                            .copyWith(color: AppColors.cFDE68A),
                      ),
                      UIHelper.verticalSpace(8.h),
                      Text(
                        "-Quran 3:191",
                        style: TextFontStyle.textStyle14cCFA128Inter500
                            .copyWith(color: AppColors.cD08D06),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget tasbihContainer(
  String tasbih,
  String inEinglish,
  bool isSelected,
  Color color,
) {
  return Container(
    padding: EdgeInsets.only(top: 8.sp),
    decoration: BoxDecoration(
      color: isSelected ? color : AppColors.c17202D,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppColors.c4B352C),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          tasbih,
          style: TextFontStyle.textStyle16cFFFFFFInter600.copyWith(
            fontSize: 20.sp,
          ),
        ),
        Text(inEinglish, style: TextFontStyle.textStyle12cFFFFFFInter500),
      ],
    ),
  );
}
