import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';


class CustomHomeTimerField extends StatefulWidget {
  final Duration initialDuration;
  const CustomHomeTimerField({super.key, required this.initialDuration});

  @override
  State<CustomHomeTimerField> createState() => _CustomHomeTimerFieldState();
}

class _CustomHomeTimerFieldState extends State<CustomHomeTimerField> {
  late Duration _remainingDuration;
  late Timer _timer;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _remainingDuration = widget.initialDuration;
    _startTimer();
  }

  void _startTimer() {
    if (_isRunning) return;

    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingDuration.inSeconds > 0) {
        setState(() {
          _remainingDuration = _remainingDuration - const Duration(seconds: 1);
        });
      } else {
        _timer.cancel();
        _isRunning = false;
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final hours = twoDigits(duration.inHours.remainder(24));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return "$hours : $minutes : $seconds";
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: .70.sw,
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.c283140.withValues(alpha: 0.5),
            AppColors.c283140.withValues(alpha: 0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.cBC5A08.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(Assets.icons.clock.path),
          UIHelper.horizontalSpace(8.w),
          Row(
            children: [
              Text(
                _formatDuration(_remainingDuration),
                style: TextFontStyle.textStyle16cFFFFFFInter600.copyWith(
                  fontFeatures: [const FontFeature.tabularFigures()],
                ),
              ),
              UIHelper.horizontalSpace(8.w),
              Text(
                "until reset",
                style: TextFontStyle.textStyle14cFCD34DInter400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
