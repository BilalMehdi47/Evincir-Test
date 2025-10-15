import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              // Profile Header
              Column(
                children: [
                  // Avatar with theme-aware border
                  Container(
                    padding: EdgeInsets.all(3.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: isDarkMode
                            ? [const Color(0xFF5C6BC0), const Color(0xFF3F51B5)]
                            : [const Color(0xFF2196F3), const Color(0xFF1976D2)],
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.grey[200],
                      child: Icon(Icons.person, size: 60.sp, color: isDarkMode ? Colors.white : Colors.grey[700]),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Name
                  Text(
                    'Bilal Mehdi',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode ? Colors.white : Colors.black,
                      letterSpacing: -0.5.w,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  // Email
                  Text(
                    'bilalmehditk@gmail.com',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: isDarkMode ? const Color(0xFF8E8E93) : Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),

              // Profile Options
              Expanded(
                child: Column(
                  children: [
                    _buildProfileOption(context, icon: Icons.person_outline, title: 'Edit Profile', onTap: () {}),
                    _buildProfileOption(context, icon: Icons.settings_outlined, title: 'Settings', onTap: () {}),
                    _buildProfileOption(context, icon: Icons.help_outline, title: 'Help & Support', onTap: () {}),
                    _buildProfileOption(
                      context,
                      icon: Icons.privacy_tip_outlined,
                      title: 'Privacy Policy',
                      onTap: () {},
                    ),
                    _buildProfileOption(
                      context,
                      icon: Icons.logout_outlined,
                      title: 'Logout',
                      isDestructive: true,
                      onTap: () {},
                    ),
                    const Spacer(),

                    // App Version
                    Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      child: Text(
                        'Version 1.0.0',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: isDarkMode ? const Color(0xFF8E8E93) : Colors.grey[600],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xFF2C2C2E) : Colors.grey[100],
            borderRadius: BorderRadius.circular(12.r),
            border: isDarkMode ? null : Border.all(color: Colors.grey[300]!, width: 0.5.w),
          ),
          child: Row(
            children: [
              Icon(icon, size: 24.sp, color: isDestructive ? Colors.red : (isDarkMode ? Colors.white : Colors.black87)),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: isDestructive ? Colors.red : (isDarkMode ? Colors.white : Colors.black87),
                  ),
                ),
              ),
              Icon(Icons.chevron_right, size: 20.sp, color: isDarkMode ? const Color(0xFF8E8E93) : Colors.grey[600]),
            ],
          ),
        ),
      ),
    );
  }
}
