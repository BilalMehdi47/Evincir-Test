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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
        height: 0.1.sh,
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25.r)),
          border: isDarkMode ? null : Border.all(color: Colors.grey[300]!, width: 1.w),
          boxShadow: [
            BoxShadow(
              color: isDarkMode ? Colors.black26 : Colors.grey.withOpacity(0.2),
              blurRadius: 15.r,
              offset: Offset(0, -3.h),
              spreadRadius: 2.r,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(context, Image.asset(AppImages.nutrition, width: 24.w, height: 24.h), 'Nutrition', 0),
              _buildNavItem(context, Image.asset(AppImages.plan, width: 24.w, height: 24.h), 'Plan', 1),
              _buildNavItem(context, Image.asset(AppImages.moodNav, width: 24.w, height: 24.h), 'Mood', 2),
              _buildNavItem(context, Image.asset(AppImages.profile, width: 24.w, height: 24.h), 'Profile', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, dynamic iconOrImage, String label, int index) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    bool isSelected = _selectedIndex == index;

    // Define colors based on theme and selection state
    Color selectedColor = isDarkMode ? Colors.white : Colors.black87;
    Color unselectedColor = isDarkMode ? Colors.grey.shade600 : Colors.grey.shade500;
    Color backgroundColor = isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.withOpacity(0.1);

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
        decoration: isSelected
            ? BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(12.r))
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
                      color: isSelected ? selectedColor : unselectedColor,
                      size: isSelected ? 26.sp : 24.sp,
                    )
                  : ColorFiltered(
                      colorFilter: ColorFilter.mode(isSelected ? selectedColor : unselectedColor, BlendMode.srcIn),
                      child: Transform.scale(scale: isSelected ? 1.1 : 1.0, child: iconOrImage),
                    ),
            ),
            SizedBox(height: 2.h),
            AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 200),
              style: TextStyle(
                color: isSelected ? selectedColor : unselectedColor,
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
