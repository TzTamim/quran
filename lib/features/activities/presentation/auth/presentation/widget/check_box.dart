import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../constants/text_font_style.dart';
import '../../../../../../gen/colors.gen.dart';
import '../../../../../../helpers/ui_helpers.dart';

class RememberMeCheckBox extends StatefulWidget {
  final Function(bool value) onChanged;

  const RememberMeCheckBox({required this.onChanged, super.key});

  @override
  State<RememberMeCheckBox> createState() => _RememberMeCheckBoxState();
}

class _RememberMeCheckBoxState extends State<RememberMeCheckBox> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16.w,
          height: 16.h,
          child: Checkbox(
              activeColor: AppColors.cE16909,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value!;
                });
                widget.onChanged(value!);
              }),
        ),
        UIHelper.horizontalSpace(8.w),
        Text(
          "Remember me",
          style: TextFontStyle.textStyle12c6A7283Inter400,
        ),
      ],
    );
  }
}
