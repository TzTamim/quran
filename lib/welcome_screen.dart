import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'common_widgets/loading_indicators.dart';
import 'gen/assets.gen.dart';
import 'helpers/ui_helpers.dart';

final class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              UIHelper.verticalSpace(.2.sh),
              Image.asset(
                Assets.images.splash.path,
              ),
              shimmer(
                context: context,
                name: Assets.lottie.loadingSpinner,
                size: 150.sp,
              )
            ]),
      ),
    );
  }
}
