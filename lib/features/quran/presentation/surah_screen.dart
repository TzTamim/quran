import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common_widgets/waiting_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/loading_helper.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../networks/api_acess.dart';
import '../../activities/presentation/auth/presentation/widget/common_back_arrow.dart';
import '../model/surah_details_res_model.dart';
import 'widgets/ayat_container.dart';

class SurahScreen extends StatefulWidget {
  final int surahNumber;

  const SurahScreen({
    super.key,
    required this.surahNumber,
  });

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  @override
  void initState() {
    super.initState();
    initialize();
  }

  initialize() async {
    _isLoading.value = true;
    await getSurahDetailsRxObj.getSurahDetails(widget.surahNumber);
    _isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200.w,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
          child: const CommonBackArrowWidget(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: ValueListenableBuilder(
              valueListenable: _isLoading,
              builder: (context, value, child) {
                if (value) {
                  return const Center(child: WaitingWidget());
                }
                return SingleChildScrollView(
                  child: StreamBuilder(
                      stream: getSurahDetailsRxObj.fileData,
                      builder: (context, asyncSnapshot) {
                        if (!asyncSnapshot.hasError &&
                            asyncSnapshot.data != null) {
                          Map<String, dynamic> response =
                              Map.from(asyncSnapshot.data);
                          SurahDetailsResModel surahDetailsResModel =
                              SurahDetailsResModel.fromJson(response);
                          return Column(
                            children: [
                              UIHelper.verticalSpace(24.sp),
                              _headerContainer(
                                  nameArabic:
                                      surahDetailsResModel.data!.nameArabic!,
                                  nameEnglish:
                                      surahDetailsResModel.data!.nameEnglish!,
                                  englishMeaning:
                                      surahDetailsResModel.data!.nameMeaning!,
                                  totalVerses:
                                      surahDetailsResModel.data!.totalVerses!,
                                  completedVerses: surahDetailsResModel
                                      .data!.completedVerses!,
                                  index: surahDetailsResModel.data!.number!,
                                  verses:
                                      surahDetailsResModel.data!.nameEnglish!,
                                  type: surahDetailsResModel.data!.surahType!,
                                  progress: int.parse(
                                    surahDetailsResModel.data!.readingProgress!
                                        .replaceAll('%', ''),
                                  )),
                              UIHelper.verticalSpace(16.sp),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    surahDetailsResModel.data!.totalVerses!,
                                itemBuilder: (context, index) {
                                  var varse =
                                      surahDetailsResModel.data!.verses![index];

                                  return GestureDetector(
                                    onTap: () {
                                      if (varse.isRead!) {
                                        postVersesReadRxObj
                                            .postVersesToggleRead(
                                              verseId: varse.verseId!,
                                            )
                                            .waitingForFutureWithoutBg()
                                            .then((v) {
                                          getSurahDetailsRxObj.getSurahDetails(
                                              widget.surahNumber);
                                          getSurahListRxObj.getSurahList("");
                                        });
                                      }
                                    },
                                    child: AyatContainer(
                                      isRead: varse.isRead!,
                                      index: index + 1,
                                      ayat: varse.textArabic!,
                                      translation: varse.textEnglish!,
                                      onMarkRead: () {
                                        postVersesReadRxObj
                                            .postVersesToggleRead(
                                              verseId: varse.verseId!,
                                            )
                                            .waitingForFutureWithoutBg()
                                            .then((v) {
                                          getSurahDetailsRxObj.getSurahDetails(
                                              widget.surahNumber);
                                          getSurahListRxObj.getSurahList("");
                                        });
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        } else {
                          return const Center(
                              child: Text("Something went wrong"));
                        }
                      }),
                );
              }),
        ),
      ),
    );
  }

  Widget _headerContainer({
    required int index,
    required String verses,
    required String type,
    required int progress,
    required String nameEnglish,
    required String nameArabic,
    required String englishMeaning,
    required int totalVerses,
    required int completedVerses,
  }) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.c1B2638,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.c4B352C),
      ),
      child: Column(
        children: [
          Container(
            height: 40.h,
            width: 80.w,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.cD87606, AppColors.cBC5A08],
              ),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.c4B352C),
            ),
            child: Center(
              child: Text(
                'Surah $index',
                style: TextFontStyle.textStyle16c979CA8Inter600.copyWith(
                  color: AppColors.c17202D,
                ),
              ),
            ),
          ),
          UIHelper.verticalSpace(12.h),
          Text(
            nameEnglish,
            style: TextFontStyle.textStyle24cFFFFFFInter600.copyWith(
              color: AppColors.cEDE3BA,
              fontSize: 32.sp,
            ),
          ),
          UIHelper.verticalSpace(12.h),
          Text(
            englishMeaning,
            style: TextFontStyle.textStyle16cFFFFFFInter600.copyWith(
              color: AppColors.cAFA26B,
              fontWeight: FontWeight.w700,
            ),
          ),
          UIHelper.verticalSpace(16.h),
          Center(
            child: Text(
              nameArabic,
              style: TextFontStyle.textStyle16cFFFFFFInter600.copyWith(
                color: AppColors.cAFA26B,
                fontSize: 32,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.icons.quranMini.path,
                height: 16.h,
                width: 16.w,
              ),
              UIHelper.horizontalSpace(8.w),
              Text(
                verses,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextFontStyle.textStyle12pxcAFA26BInter500.copyWith(
                  color: AppColors.cCFA128,
                ),
              ),
              UIHelper.horizontalSpace(4.w),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  height: 28.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.c392C2E,
                  ),
                  child: Center(
                    child: Text(
                      type,
                      style: TextFontStyle.textStyle12c00AF3AInter400.copyWith(
                        color: AppColors.cD08D06,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          UIHelper.verticalSpace(24.h),
          Container(
            padding: EdgeInsets.all(8.sp),
            width: double.infinity,
            decoration: BoxDecoration(
              border:
                  Border.all(color: AppColors.cBC5A08.withValues(alpha: .2)),
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  AppColors.cBC5A08.withValues(alpha: 0.5),
                  AppColors.cBC5A08.withValues(alpha: 0),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.icons.readingProgress.path,
                        height: 20.h,
                        width: 20.w,
                      ),
                      UIHelper.horizontalSpace(8.w),
                      Text(
                        "Reading\nProgress",
                        style:
                            TextFontStyle.textStyle14c17202DInter600.copyWith(
                          color: AppColors.cFDE68A,
                        ),
                      ),
                      UIHelper.horizontalSpace(8.w),
                      SizedBox(
                        height: 75.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "$progress%",
                              style: TextFontStyle.textStyle24cF9BA2DInter700,
                            ),
                            Text(
                              '$completedVerses/$totalVerses',
                              style: TextFontStyle.textStyle14cAFA26BInter600,
                            ),
                            Text(
                              'Verses',
                              style: TextFontStyle.textStyle14cCFA128Inter500
                                  .copyWith(fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: EdgeInsets.all(6.sp),
                        width: 84.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.c0E141B,
                          border: Border.all(color: AppColors.cDF2139),
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            await postResetSurahProgressRxObj
                                .postresetSurahProgress(widget.surahNumber)
                                .waitingForFutureWithoutBg()
                                .then((value) {
                              if (value) {
                                getSurahDetailsRxObj
                                    .getSurahDetails(widget.surahNumber);
                                getSurahListRxObj.getSurahList("");
                              }
                            });
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                Assets.icons.resetsIcon.path,
                                height: 16.h,
                                width: 16.w,
                              ),
                              UIHelper.horizontalSpace(10.w),
                              SizedBox(
                                height: 21.h,
                                width: 40.w,
                                child: Text(
                                  "Reset",
                                  style: TextFontStyle
                                      .textStyle14c979CA8Inter400
                                      .copyWith(color: AppColors.cF87171),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(12.h),
                Container(
                  height: 8.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.c404A60,
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double progressValue = progress.toDouble() / 100;
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 8.h,
                          width: constraints.maxWidth * progressValue,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20.r),
                            ),
                            color: AppColors.c00264D,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                UIHelper.verticalSpace(8.h),
                SizedBox(
                  height: 16.h,
                  width: double.infinity,
                  child: Text(
                    "+1 point per verse • +10 bonus on completion",
                    style: TextFontStyle.textStyle12c00AF3AInter400.copyWith(
                      color: AppColors.cAFA26B,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
