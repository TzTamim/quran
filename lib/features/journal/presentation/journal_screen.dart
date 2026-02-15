import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';

import '../../../common_widgets/custom_toast.dart';
import '../../../common_widgets/waiting_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/helper_methods.dart';
import '../../../helpers/loading_helper.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../networks/api_acess.dart';
import '../../activities/presentation/auth/presentation/widget/common_back_arrow.dart';
import '../model/journal_list_res_model.dart';
import '../model/journal_mood_list_res_model.dart';
import '../model/journal_type_res_model.dart';
import 'widgets/dropdown.dart';
import 'widgets/entry_container.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool showExpanded = false;

  @override
  void initState() {
    super.initState();
    getJournalTypeRxObj.getJournalType();
    getMoodListRxObj.getJournalMoodList();
    getJournalListRxObj.getJournalList();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 100.w,
        leading: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
          child: const CommonBackArrowWidget(),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder(
            stream: Rx.combineLatest3(
                getJournalTypeRxObj.fileData,
                getMoodListRxObj.fileData,
                getJournalListRxObj.fileData,
                (a, b, c) => [a, b, c]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: WaitingWidget());
              } else if (!snapshot.hasError && snapshot.data != null) {
                JournaTypeListResModel journaTypeListResModel =
                    JournaTypeListResModel.fromJson(snapshot.data![0]);
                JournalMoodListResModel journalMoodListResModel =
                    JournalMoodListResModel.fromJson(snapshot.data![1]);
                JournalListResModel journalListResModel =
                    JournalListResModel.fromJson(snapshot.data![2]);
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                      horizontal: UIHelper.kDefaulutPadding()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIHelper.verticalSpace(24.h),
                      Text(
                        "Journal",
                        style: TextFontStyle.textStyle32cFDE68AGeorgia700,
                      ),
                      UIHelper.verticalSpace(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "Record your thoughts and reflections",
                              style: TextFontStyle.textStyle16c17202DInter500
                                  .copyWith(
                                color: AppColors.cAFA26B,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showExpanded = !showExpanded;
                              });
                            },
                            child: Container(
                              height: 44.h,
                              width: 136.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: const LinearGradient(
                                  colors: [
                                    AppColors.cD87606,
                                    AppColors.cBC5A08
                                  ],
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: AppColors.c000000,
                                    size: 16.sp,
                                  ),
                                  UIHelper.horizontalSpace(10.w),
                                  Text(
                                    "New Entry",
                                    style: TextFontStyle
                                        .textStyle16cFCD34DInter600
                                        .copyWith(color: AppColors.c17202D),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      UIHelper.verticalSpace(24.h),
                      newEntryField(
                        showExpanded,
                        _titleController,
                        _descriptionController,
                        moodRes: journalMoodListResModel,
                        typeRes: journaTypeListResModel,
                        onCancel: () {
                          setState(() {
                            showExpanded = false;
                            _titleController.clear();
                            _descriptionController.clear();
                          });
                        },
                      ),
                      UIHelper.verticalSpace(16.h),
                      if (journalListResModel.data?.isEmpty ?? true) ...[
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(top: .2.sh),
                            child: Text(
                              "No Journal Entries",
                              style: TextFontStyle.textStyle16c17202DInter500
                                  .copyWith(color: AppColors.cAFA26B),
                            ),
                          ),
                        ),
                      ] else ...[
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: journalListResModel.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              var data = journalListResModel.data![index];
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.h),
                                child: EntryContainer(
                                  createdAt: formatDate(
                                      data.createdAt!.toIso8601String()),
                                  description: data.contentPreview ?? "",
                                  title: data.entryType?.name ?? "",
                                  containerColor: AppColors.c362E5B,
                                  textcolor: AppColors.cF4A4D1,
                                  onDelete: () {
                                    deleteJournalEntryRxObj
                                        .deleteJournalEntry(data.id ?? 0)
                                        .waitingForFutureWithoutBg()
                                        .then((v) {
                                      if (v) {
                                        getJournalListRxObj.getJournalList();
                                      }
                                    });
                                  },
                                ),
                              );
                            })
                      ]
                    ],
                  ),
                );
              } else {
                return const Center(child: Text("Something went wrong"));
              }
            }),
      ),
    );
  }
}

Widget newEntryField(
  bool showExpanded,
  TextEditingController titleController,
  TextEditingController descriptionController, {
  required JournalMoodListResModel moodRes,
  required JournaTypeListResModel typeRes,
  required Function() onCancel,
}) {
  Mood? mood;
  JournaType? type;
  return AnimatedSize(
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeInOut,
    child: showExpanded
        ? Container(
            padding: EdgeInsets.all(16.sp),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.c1B2638,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.c4B352C),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New journey Entry",
                  style: TextFontStyle.textStyle20cEDE3BAInter700.copyWith(
                    color: AppColors.cFDE68A,
                    fontSize: 18.sp,
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Container(
                  height: 34.h,
                  width: 295.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.c4B352C),
                  ),
                  child: TextField(
                    style: const TextStyle(color: AppColors.c5A6270),
                    cursorColor: AppColors.c5A6270,
                    controller: titleController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      hintText: "Entry Title",
                      hintStyle: const TextStyle(color: AppColors.c5A6270),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Container(
                  height: 89.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.c4B352C),
                  ),
                  child: TextField(
                    maxLines: 4,
                    style: const TextStyle(color: AppColors.c5A6270),
                    cursorColor: AppColors.c5A6270,
                    controller: descriptionController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      hintText: "While your thoughts...",
                      hintStyle: const TextStyle(color: AppColors.c5A6270),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Row(
                  children: [
                    dropdownField(
                        title: 'Mood',
                        items: moodRes.data!.map((e) => e).toList(),
                        onSelected: (value) {
                          mood = value;
                        }),
                    UIHelper.horizontalSpace(15.w),
                    dropdownField(
                        title: 'Type',
                        items: typeRes.data!.map((e) => e).toList(),
                        onSelected: (value) {
                          type = value;
                        }),
                  ],
                ),
                UIHelper.verticalSpace(16.h),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          try {
                            postJournalSaveEntryRxObj
                                .postJournalSaveEntry(
                                  title: titleController.text,
                                  trhoughts: descriptionController.text,
                                  moodId: mood!.id!,
                                  entryTypeId: type!.id!,
                                )
                                .waitingForFutureWithoutBg()
                                .then((value) {
                              if (value) {
                                titleController.clear();
                                descriptionController.clear();
                                getJournalListRxObj.getJournalList();
                              }
                            });
                          } catch (e) {
                            customToastMessage("Error", "Something went wrong");
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(
                              colors: [AppColors.cD87606, AppColors.cBC5A08],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Save Entry",
                              style: TextFontStyle.textStyle16cFCD34DInter600
                                  .copyWith(
                                color: AppColors.c17202D,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    UIHelper.horizontalSpace(16.sp),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: onCancel,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.c17202D,
                            border: Border.all(color: AppColors.c4B352C),
                          ),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: TextFontStyle.textStyle16cFCD34DInter600
                                  .copyWith(
                                color: AppColors.cFCD34D,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        : const SizedBox(),
  );
}

Widget dropdownField({
  required String title,
  required List items,
  required Function(dynamic) onSelected,
}) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextFontStyle.textStyle14cAFA26BInter600),
        UIHelper.verticalSpace(12.h),
        CustomDropdown(
          hint: "Select Type",
          items: items,
          onSelected: (value) {
            onSelected(value);
          },
        ),
      ],
    ),
  );
}
