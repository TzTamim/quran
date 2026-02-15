import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common_widgets/custom_textfield.dart';
import '../../../../common_widgets/custom_toast.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/loading_helper.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../networks/api_acess.dart';
import '../../model/triggers_res_model.dart';
import '../overcome_subtab_screen.dart';

class SetUpRecoveryJourneyCard extends StatefulWidget {
  final List<TriggesResModel> triggers;
  final List<TriggesResModel> strategies;
  const SetUpRecoveryJourneyCard(
      {required this.triggers, required this.strategies, super.key});

  @override
  State<SetUpRecoveryJourneyCard> createState() =>
      _SetUpRecoveryJourneyCardState();
}

class _SetUpRecoveryJourneyCardState extends State<SetUpRecoveryJourneyCard> {
  final TextEditingController overcomingController = TextEditingController();
  final TextEditingController whyOvercomingController = TextEditingController();
  final TextEditingController triggerController = TextEditingController();
  final TextEditingController strategyController = TextEditingController();
  final TextEditingController thoughtController = TextEditingController();

  @override
  void dispose() {
    overcomingController.dispose();
    whyOvercomingController.dispose();
    triggerController.dispose();
    strategyController.dispose();
    thoughtController.dispose();

    super.dispose();
  }

  Set<String> selectedTriggers = {};
  Set<String> selectedStrategies = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.c1B2638,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.c4B352C),
      ),
      child: Column(
        children: [
          UIHelper.verticalSpace(20.h),
          Text(
            "Set Up Your Recovery Journey",
            style: TextFontStyle.textStyle20cEDE3BAInter700,
          ),
          UIHelper.verticalSpace(12.h),
          Text(
            "Take time to answer these questions honestly-\nthey'll help you succeed",
            style: TextFontStyle.textStyle12cFCD34DInter600
                .copyWith(color: AppColors.cAFA26B),
          ),
          UIHelper.verticalSpace(12.h),
          const Divider(color: AppColors.c4B352C),
          UIHelper.verticalSpace(4.h),
          Container(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      Assets.icons.what.path,
                      height: 20.h,
                      width: 20.w,
                    ),
                    UIHelper.horizontalSpace(8.h),
                    Text(
                      "What are you overcoming?",
                      style: TextFontStyle.textStyle18cFDE68AInter700,
                    ),
                  ],
                ),
                UIHelper.verticalSpace(12.h),
                CustomTextField(
                  controller: overcomingController,
                  hintText: "e.g., PMO, smoking, social media a",
                  textStyle: TextStyle(
                    color: AppColors.cAFA26B,
                    fontSize: 14.sp,
                  ),
                  hintStyle: const TextStyle(color: AppColors.cAFA26B),
                  cursorColor: AppColors.cAFA26B,
                  borderColor: AppColors.c4B352C,
                  width: 295.w,
                  height: 45.h,
                  maxLines: 1,
                ),
                UIHelper.verticalSpace(12.h),
                Row(
                  children: [
                    Image.asset(
                      Assets.icons.heartIcon.path,
                      height: 20.h,
                      width: 20.w,
                      color: AppColors.cFDE68A,
                    ),
                    UIHelper.horizontalSpace(8.h),
                    Text(
                      "Why do you want to overcome\nthis?",
                      style: TextFontStyle.textStyle18cFDE68AInter700,
                    ),
                  ],
                ),
                UIHelper.verticalSpace(12.h),
                CustomTextField(
                  controller: whyOvercomingController,
                  hintText:
                      "For Allah, for my family, for my health,\nto become a better person...",
                  textStyle: TextStyle(
                    color: AppColors.cAFA26B,
                    fontSize: 14.sp,
                  ),
                  hintStyle: const TextStyle(color: AppColors.cAFA26B),
                  cursorColor: AppColors.cAFA26B,
                  borderColor: AppColors.c4B352C,
                  width: 296.w,
                  height: 103.h,
                  maxLines: 4,
                ),
                UIHelper.verticalSpace(24.h),
                Row(
                  children: [
                    Image.asset(
                      Assets.icons.denger.path,
                      height: 20.h,
                      width: 20.w,
                    ),
                    UIHelper.horizontalSpace(8.h),
                    Text(
                      "What triggers you? (Select all\nthat apply)",
                      style: TextFontStyle.textStyle18cFDE68AInter700,
                    ),
                  ],
                ),
                UIHelper.verticalSpace(12.h),
                Wrap(
                  spacing: 4.w,
                  runSpacing: 6.h,
                  children: List.generate(
                    widget.triggers.length,
                    (index) => InkWell(
                      onTap: () {
                        if (!selectedTriggers
                            .contains(widget.triggers[index].name)) {
                          selectedTriggers
                              .add(widget.triggers[index].name ?? "");
                        } else {
                          selectedTriggers.remove(widget.triggers[index].name);
                        }
                        log(selectedTriggers.toList().toString());
                        setState(() {});
                      },
                      child:
                          selectedTriggers.contains(widget.triggers[index].name)
                              ? selectedTriggerTypesContiner(
                                  widget.triggers[index].name ?? "")
                              : triggerTypesContiner(
                                  widget.triggers[index].name ?? ""),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(24.h),
                Row(
                  children: [
                    CustomTextField(
                      hintText: "Add custom trigger...",
                      controller: triggerController,
                      textStyle: TextStyle(
                        color: AppColors.cAFA26B,
                        fontSize: 14.sp,
                      ),
                      hintStyle: const TextStyle(
                        color: AppColors.cAFA26B,
                      ),
                      cursorColor: AppColors.cAFA26B,
                      borderColor: AppColors.c4B352C,
                      width: 228.w,
                      height: 40.h,
                      maxLines: 4,
                    ),
                    UIHelper.horizontalSpace(12.w),
                    InkWell(
                      child: Container(
                        height: 40.h,
                        width: 53.w,
                        decoration: BoxDecoration(
                          color: AppColors.cFFFFFF,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          CupertinoIcons.add,
                          color: AppColors.c17202D,
                        ),
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(24.h),
                Row(
                  children: [
                    Image.asset(
                      Assets.icons.light.path,
                      height: 20.h,
                      width: 20.w,
                    ),
                    UIHelper.horizontalSpace(8.h),
                    Text(
                      "What coping strategies will \nyou use?",
                      style: TextFontStyle.textStyle18cFDE68AInter700,
                    ),
                  ],
                ),
                UIHelper.verticalSpace(12.h),
                Wrap(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  spacing: 4.w,
                  runSpacing: 6.h,
                  children: List.generate(
                    widget.strategies.length,
                    (index) => InkWell(
                      onTap: () {
                        if (!selectedStrategies
                            .contains(widget.strategies[index].name)) {
                          selectedStrategies
                              .add(widget.strategies[index].name ?? "");
                        } else {
                          selectedStrategies
                              .remove(widget.strategies[index].name);
                        }
                        log(selectedStrategies.toList().toString());
                        setState(() {});
                      },
                      child: selectedStrategies
                              .contains(widget.strategies[index].name!)
                          ? selectedTriggerTypesContiner(
                              widget.strategies[index].name!)
                          : triggerTypesContiner(
                              widget.strategies[index].name!),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(24.h),
                Row(
                  children: [
                    CustomTextField(
                      hintText: "Add custom strategy...",
                      controller: strategyController,
                      textStyle: TextStyle(
                        color: AppColors.cAFA26B,
                        fontSize: 14.sp,
                      ),
                      hintStyle: const TextStyle(
                        color: AppColors.cAFA26B,
                      ),
                      cursorColor: AppColors.cAFA26B,
                      borderColor: AppColors.c4B352C,
                      width: 228.w,
                      height: 40.h,
                      maxLines: 4,
                    ),
                    UIHelper.horizontalSpace(12.w),
                    InkWell(
                      child: Container(
                        height: 40.h,
                        width: 53.w,
                        decoration: BoxDecoration(
                          color: AppColors.cFFFFFF,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          CupertinoIcons.add,
                          color: AppColors.c17202D,
                        ),
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(24.h),
                Row(
                  children: [
                    Image.asset(
                      Assets.icons.quranMini.path,
                      height: 20.h,
                      width: 20.w,
                      color: AppColors.cFDE68A,
                    ),
                    UIHelper.horizontalSpace(8.h),
                    Text(
                      "Additional thoughts (optional)",
                      style: TextFontStyle.textStyle18cFDE68AInter700,
                    ),
                  ],
                ),
                UIHelper.verticalSpace(12.h),
                CustomTextField(
                  hintText:
                      "Share your story, your struggles, yourhopes... This is your private space.",
                  controller: thoughtController,
                  textStyle: TextStyle(
                    color: AppColors.cAFA26B,
                    fontSize: 14.sp,
                  ),
                  hintStyle: const TextStyle(color: AppColors.cAFA26B),
                  cursorColor: AppColors.cAFA26B,
                  borderColor: AppColors.c4B352C,
                  width: 296.w,
                  height: 103.h,
                  maxLines: 4,
                ),
                UIHelper.verticalSpace(24.h),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          //cancel button
                          selectedStrategies = {};
                          selectedTriggers = {};
                          overcomingController.clear();
                          whyOvercomingController.clear();
                          triggerController.clear();
                          strategyController.clear();
                          thoughtController.clear();
                          setState(() {});
                        },
                        child: Container(
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.c17202D,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.c4B352C,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: TextFontStyle.textStyle16cEDE3BAInter700
                                  .copyWith(color: AppColors.cFDE68A),
                            ),
                          ),
                        ),
                      ),
                    ),
                    UIHelper.horizontalSpace(12.h),
                    Expanded(
                      flex: 3,
                      child: GestureDetector(
                        onTap: () {
                          postBeginJourneyRxObj
                              .postBeginJourney(
                                  additionalThoughts: thoughtController.text,
                                  overcoming: overcomingController.text,
                                  motivation: whyOvercomingController.text,
                                  triggers: selectedTriggers.toList(),
                                  strategies: selectedStrategies.toList())
                              .waitingForFutureWithoutBg()
                              .then((v) {
                            if (v) {
                              customToastMessage(
                                  "Successfully", "Begin Journey");
                              selectedStrategies = {};
                              selectedTriggers = {};
                              overcomingController.clear();
                              whyOvercomingController.clear();
                              triggerController.clear();
                              strategyController.clear();
                              thoughtController.clear();
                              setState(() {});
                            }
                          });
                        },
                        child: Container(
                          height: 40.h,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                AppColors.cD87606,
                                AppColors.cBC5A08,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              "Begin Journey",
                              style: TextFontStyle.textStyle16cEDE3BAInter700
                                  .copyWith(color: AppColors.c17202D),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
