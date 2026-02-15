import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color cursorColor;
  final double? width;
  final double? height;
  final Color borderColor;
  final int maxLines;
  final bool readOnly;

  const CustomTextField({
    super.key,
    required this.controller,
    this.readOnly = false,
    this.hintText = "",
    this.textStyle,
    this.hintStyle,
    this.cursorColor = Colors.grey,
    this.width,
    this.height,
    this.borderColor = Colors.grey,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 34.h,
      width: width ?? 295.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: TextField(
        controller: controller,
        style: textStyle,
        cursorColor: cursorColor,
        maxLines: maxLines,
        readOnly: readOnly,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          hintText: hintText,
          hintStyle: hintStyle,
        ),
      ),
    );
  }
}
