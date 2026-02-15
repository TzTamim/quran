import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/colors.gen.dart';

class CustomDropdown extends StatefulWidget {
  final String hint;
  final List<dynamic> items;
  final Function(dynamic) onSelected;

  const CustomDropdown({
    super.key,
    required this.hint,
    required this.items,
    required this.onSelected,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  dynamic selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.c1B2638,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.c4B352C, width: 1),
      ),
      child: PopupMenuButton<dynamic>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: AppColors.c4B352C),
        ),
        color: AppColors.c17202D,
        elevation: 4,
        onSelected: (value) {
          setState(() {
            selectedValue = value;
          });
          widget.onSelected(value);
        },
        itemBuilder: (context) {
          return widget.items.map((item) {
            return PopupMenuItem<dynamic>(
              value: item,
              child: Text(
                item.name,
                style: TextStyle(
                  color: AppColors.cEDE3BA,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedValue?.name ?? widget.hint,
              style: TextStyle(
                color: selectedValue != null
                    ? AppColors.cEDE3BA
                    : AppColors.c5A6270,
                fontSize: 14.sp,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down_rounded,
                color: AppColors.c5A6270),
          ],
        ),
      ),
    );
  }
}
