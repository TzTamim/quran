// onbording_provider.dart
import 'dart:async';
import 'package:flutter/material.dart';

import '../model/onbording_model.dart';

class OnbordingProvider extends ChangeNotifier {
  int _currentIndex = 0;
  final PageController pageController = PageController();

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    if (_currentIndex != value) {
      _currentIndex = value;
      notifyListeners();
    }
  }

  // Next button
  void nextPage() {
    if (currentIndex < onbordingList.length - 1) {
      currentIndex++;
    }
  }

  void previousPage() {
    if (currentIndex > 0) {
      currentIndex--;
    }
  }

  void startAutoPlay() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (currentIndex >= onbordingList.length - 1) {
        currentIndex = 0;
      } else {
        currentIndex++;
      }
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
