import 'package:evencir_test/constants/app_images.dart';
import 'package:evencir_test/feature/mood/presentation/widget/mood_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoodScreen extends StatefulWidget {
  const MoodScreen({super.key});

  @override
  _MoodScreenState createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  double _value = 0.6; // Initial value for 'Content'
  String _mood = 'Calm';

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: isDarkMode ? Colors.black : Colors.white),
        child: Stack(
          children: [
            // Background image with theme-aware overlay
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 0.3.sh,
              child: Stack(
                children: [
                  Image.asset(AppImages.bgImage, fit: BoxFit.cover),
                  // Add overlay for light mode to ensure text readability
                  if (!isDarkMode) Container(color: Colors.black.withOpacity(0.3)),
                ],
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mood',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white, // Keep white for both due to background image
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Text(
                        'Start your day',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white, // Keep white for both due to background image
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Text(
                        'How are you feeling at the\nMoment?',
                        style: TextStyle(
                          fontSize: 24.sp,
                          color: Colors.white, // Keep white for both due to background image
                        ),
                      ),
                    ),
                    Spacer(),
                    // Keep original centered positioning
                    Center(
                      child: MoodCircleSelector(
                        imageSize: 90.w,
                        value: _value,
                        onValueChanged: (newValue) {
                          setState(() {
                            _value = newValue;
                            if (newValue < 0.25) {
                              _mood = 'Content';
                            } else if (newValue < 0.5) {
                              _mood = 'Peaceful';
                            } else if (newValue < 0.75) {
                              _mood = 'Happy';
                            } else {
                              _mood = 'Calm';
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Center(
                      child: Text(
                        _mood,
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                    Spacer(),
                    // Theme-aware continue button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDarkMode ? Colors.white : Colors.black,
                          foregroundColor: isDarkMode ? Colors.black : Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
                          minimumSize: Size(double.infinity, 50.h),
                          elevation: isDarkMode ? 0 : 2,
                        ),
                        child: Text(
                          'Continue',
                          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
