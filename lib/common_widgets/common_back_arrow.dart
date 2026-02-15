import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../gen/assets.gen.dart';
import '../helpers/navigation_service.dart';

class CommonBackArrowWidget extends StatelessWidget {
  const CommonBackArrowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          if (NavigationService.goBeBack) {
            NavigationService.goBack;
          }
        },
        child: SizedBox(
          width: 40.w,
          height: 40.h,
          child: Image.asset(Assets.icons.circleBackIcon.path),
        ),
      ),
    );
  }
}
