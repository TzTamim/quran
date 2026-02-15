import 'package:flutter/material.dart';

import '../../../../gen/colors.gen.dart';

class UnredPageScreen extends StatelessWidget {
  const UnredPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(color: AppColors.cFFFFFF, child: const Column()),
      ),
    );
  }
}
