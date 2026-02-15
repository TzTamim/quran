import 'package:flutter/material.dart';

import '../../../../gen/colors.gen.dart';


class RedPageScreen extends StatelessWidget {
  const RedPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(color: AppColors.cFFFFFF, child: const Column()),
      ),
    );
  }
}
