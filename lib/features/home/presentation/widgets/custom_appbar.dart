import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import 'custom_notificatin_popup.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      centerTitle: true,
      title: Text(
        'Iman Flow',
        style: TextFontStyle.textStyle24cFFFFFFGeorgia700,
      ),
      actions: [
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              CustomNotificationPopup.show(context);
            },
          ),
        ),
      ],
    );
  }
}
