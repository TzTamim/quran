import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../gen/assets.gen.dart';

Widget arrowRightButton({required Function()? onTap}) {
  return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Image.asset(
        Assets.icons.arrowRight.path,
        width: 90.w,
      ));
}
