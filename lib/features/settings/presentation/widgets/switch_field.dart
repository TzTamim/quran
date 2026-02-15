import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class SwitchField extends StatefulWidget {
  final bool isSwitched;
  final String title;
  final String subtitle;
  const SwitchField({
    super.key,
    required this.isSwitched,
    required this.title,
    required this.subtitle,
  });

  @override
  State<SwitchField> createState() => _SwitchFieldState();
}

class _SwitchFieldState extends State<SwitchField> {
  late bool isSwitched;

  @override
  void initState() {
    super.initState();
    isSwitched = widget.isSwitched; // initialize local state
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: TextFontStyle.textStyle16cFDE68AInter700,
            ),
            UIHelper.horizontalSpace(121.w),
            Switch(
              activeThumbColor: AppColors.cFFFFFF,
              inactiveThumbColor: AppColors.cFFFFFF,
              activeTrackColor: AppColors.c1330BE,
              inactiveTrackColor: AppColors.c505050,
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ],
        ),
        UIHelper.verticalSpace(8.h),
        Text(
          widget.subtitle,
          style: TextFontStyle.textStyle12cFFFFFFInter500.copyWith(
            color: AppColors.c997D2E,
          ),
        ),
      ],
    );
  }
}
