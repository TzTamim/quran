

import '../../../gen/assets.gen.dart';

class OnbordingModel {
  String image;
  String title;
  String description;
  OnbordingModel(
      {required this.image, required this.title, required this.description});
}

List<OnbordingModel> onbordingList = [
  OnbordingModel(
      image: Assets.images.onbording1.path,
      title: "Consistent Deen Progress",
      description:
          "Daily Fajr, Quran, dhikr, and good habits track korun — easily & peacefully."),
  OnbordingModel(
      image: Assets.images.onbording2.path,
      title: "Maintain Your Streaks",
      description: "When you complete your habits daily, your streak grows."),
  OnbordingModel(
      image: Assets.images.onbording3.path,
      title: "Your Deen journey",
      description:
          "Your Deen journey begins with your daily habits  all with just one click."),
];
