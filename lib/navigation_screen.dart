import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'features/activities/presentation/activities_screen.dart';
import 'features/dhikr/presentation/dhikr_screen.dart';
import 'features/home/home_screen.dart';
import 'features/profile/presentation/profile_screen.dart';
import 'features/quran/presentation/quran_screen.dart';
import 'gen/colors.gen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedIndex = 0;
  final List<StatefulWidget> _pages = [
    const HomeScreen(),
    const QuranScreen(),
    const ActivitiesScreen(),
    const DhikrScreen(),
    const ProfileScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.c283140,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        selectedItemColor: AppColors.cFCD34D,
        unselectedItemColor: AppColors.c888E9C,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.home_outlined, 0),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(CupertinoIcons.book, 1),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.local_activity_outlined, 2),
            label: "Activities",
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.settings, 3),
            label: "dhikr",
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(CupertinoIcons.person, 4),
            label: "Profile",
          ),
        ],
      ),
      body: _pages[selectedIndex],
    );
  }

  Widget _buildIcon(IconData iconData, int index) {
    bool isSelected = selectedIndex == index;
    return Container(
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected
            ? AppColors.cFCD34D.withValues(alpha: 0.1)
            : Colors.transparent,
      ),
      child: Icon(
        iconData,
        color: isSelected ? AppColors.cFCD34D : AppColors.c888E9C,
      ),
    );
  }
}
