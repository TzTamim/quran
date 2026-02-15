import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common_widgets/waiting_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../networks/api_acess.dart';
import '../model/surah_list_res_model.dart';
import 'widgets/surah_container.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    getSurahListRxObj.getSurahList("");
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: StreamBuilder(
              stream: getSurahListRxObj.fileData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: WaitingWidget(),
                  );
                } else if (!snapshot.hasError && snapshot.data != null) {
                  SurahListResModel surahListResModel =
                      SurahListResModel.fromJson(snapshot.data!);
                  var surachList = surahListResModel.data?.surahs ?? [];
                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(children: [
                          Image.asset(
                            Assets.icons.quranIconQuranScreen.path,
                            height: 60.h,
                            width: 60,
                          ),
                          UIHelper.verticalSpace(4.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 64.0.w),
                            child: Text(
                              "The Nobel Quran",
                              style: TextFontStyle.textStyle32cF9BA2DGeorgia700,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          UIHelper.verticalSpace(12.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                            child: Column(
                              children: [
                                Text(
                                  "Read, reflect, and learn from thewords of Allah",
                                  style: TextFontStyle
                                      .textStyle14cAFA26BInter700
                                      .copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "\"Indeed, this Quran guides to that which is most suitable\" - 17:9",
                                  style: TextFontStyle
                                      .textStyle12cFDE68AGeorgia700,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          UIHelper.verticalSpace(16.h),
                          SizedBox(
                            height: 92.h,
                            width: 324.w,
                            child: Row(
                              children: [
                                customeProgressContainer(
                                  'Surahs Completed',
                                  "${surahListResModel.data!.surahsCompleted}/114",
                                  AppColors.cBC5A08.withValues(alpha: 0.5),
                                  AppColors.cBC5A08.withValues(alpha: 0),
                                  AppColors.cCFA128,
                                  AppColors.cF9BA2D,
                                  AppColors.cBC5A08.withValues(alpha: 0.5),
                                ),
                                UIHelper.horizontalSpace(12.w),
                                customeProgressContainer(
                                  'Verses\nRead',
                                  "${surahListResModel.data!.versesRead}",
                                  AppColors.c0E6C4A,
                                  AppColors.c152032,
                                  AppColors.c0A957B,
                                  AppColors.c15C0A0,
                                  AppColors.c06775C,
                                ),
                                UIHelper.horizontalSpace(12.w),
                                customeProgressContainer(
                                  'Overall Progress',
                                  "${surahListResModel.data!.overallProgressPercentage!.toInt()}%",
                                  AppColors.c553574,
                                  AppColors.c1A1F36,
                                  AppColors.cBA94DF,
                                  AppColors.cC084FC,
                                  AppColors.cBA94DF,
                                ),
                              ],
                            ),
                          ),
                          UIHelper.verticalSpace(16.h),
                        ]),
                      ),
                      SliverAppBar(
                        pinned: true,
                        floating: false,
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        toolbarHeight: 60.0,
                        automaticallyImplyLeading: false,
                        title: _searchField(_searchController),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(top: 16.0.h),
                              child: SurahContainer(
                                surahNumber: surachList[index].number ?? 0,
                                title: surachList[index].nameEnglish ?? "",
                                subtitle: surachList[index].nameMeaning ?? "",
                                verses:
                                    surachList[index].totalVerses.toString(),
                                type: surachList[index].surahType ?? "",
                                progress: surachList[index]
                                    .progressPercentage!
                                    .toInt(),
                              ),
                            );
                          },
                          childCount: surachList.length,
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

Widget customeProgressContainer(
  String title,
  String progress,
  Color color1,
  Color color2,
  Color textcolor,
  Color progressColor,
  Color borderColor,
) {
  return Container(
    padding: EdgeInsets.all(8.sp),
    height: 92.h,
    width: 100.w,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [color1, color2]),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(width: 0.6, color: borderColor),
    ),
    child: Column(
      children: [
        SizedBox(
          height: 36.h,
          width: 84.w,
          child: Text(
            title,
            style: TextFontStyle.textStyle12cFFFFFFInter500.copyWith(
              color: textcolor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        UIHelper.verticalSpace(4.h),
        Text(
          progress,
          style: TextFontStyle.textStyle14cAFA26BInter700.copyWith(
            color: progressColor,
            fontSize: 24,
          ),
        ),
      ],
    ),
  );
}

Widget _searchField(TextEditingController searchController) {
  return Container(
    height: 40.h,
    decoration: BoxDecoration(
      color: AppColors.c1B2638,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppColors.c4B352C),
    ),
    child: TextFormField(
      onChanged: (value) {
        getSurahListRxObj.getSurahList(value);
      },
      controller: searchController,
      cursorColor: AppColors.cAFA26B,
      style: TextFontStyle.textStyle14cFCD34DInter400.copyWith(
        color: AppColors.cAFA26B,
      ),
      decoration: InputDecoration(
        hintText: 'Search by Surah name, translation ...',
        hintStyle: TextFontStyle.textStyle14cBA9941Inter400.copyWith(
          color: AppColors.cAFA26B,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.c4B352C),
        ),
        prefixIcon: Container(
          padding: EdgeInsets.symmetric(vertical: 9.5.sp, horizontal: 12.sp),
          height: 20.h,
          width: 20.w,
          child: const Icon(Icons.search, color: AppColors.cF9BA2D),
        ),
      ),
    ),
  );
}
