import 'package:evencir_test/constants/app_images.dart';
import 'package:evencir_test/feature/home/presentation/home_screen.dart';
import 'package:evencir_test/feature/mood/presentation/mood_screen.dart';
import 'package:evencir_test/feature/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../plan/presentation/plan_screen.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [NutritionScreen(), PlanScreen(), MoodScreen(), ProfileScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: Container(
        height: 0.1.sh, // More responsive height
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(25.r)),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 15.r, offset: Offset(0, -3.h), spreadRadius: 2.r)],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Image.asset(AppImages.nutrition, width: 24.w, height: 24.h), 'Nutrition', 0),
              _buildNavItem(Image.asset(AppImages.plan, width: 24.w, height: 24.h), 'Plan', 1),
              _buildNavItem(Image.asset(AppImages.moodNav, width: 24.w, height: 24.h), 'Mood', 2),
              _buildNavItem(Image.asset(AppImages.profile, width: 24.w, height: 24.h), 'Profile', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(dynamic iconOrImage, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
        decoration: isSelected
            ? BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(12.r))
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              child: iconOrImage is IconData
                  ? Icon(
                      iconOrImage,
                      color: isSelected ? Colors.white : Colors.grey.shade600,
                      size: isSelected ? 26.sp : 24.sp,
                    )
                  : ColorFiltered(
                      colorFilter: ColorFilter.mode(isSelected ? Colors.white : Colors.grey.shade600, BlendMode.srcIn),
                      child: Transform.scale(scale: isSelected ? 1.1 : 1.0, child: iconOrImage),
                    ),
            ),
            SizedBox(height: 2.h),
            AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 200),
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade600,
                fontSize: isSelected ? 11.sp : 10.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
