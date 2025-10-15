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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black, // Black background
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 0.3.sh, // Responsive height using ScreenUtil
              child: Image.asset(AppImages.bgImage, fit: BoxFit.cover),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mood',
                      style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                    SizedBox(height: 16.h),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Text(
                        'Start your day',
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Text(
                        'How are you feeling at the\nMoment?',
                        style: TextStyle(fontSize: 24.sp, color: Colors.white),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: MoodCircleSelector(
                        imageSize: 90.w, // Responsive image size
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
                        style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
                          minimumSize: Size(double.infinity, 50.h),
                        ),
                        child: Text('Continue', style: TextStyle(fontSize: 16.sp)),
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
