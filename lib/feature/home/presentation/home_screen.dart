import 'package:evencir_test/feature/home/presentation/widgets/calemdar_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/app_images.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppImages.bellIcon, width: 18.w, height: 18.h, color: Colors.white),
                    Row(
                      children: [
                        Image.asset(AppImages.timer, width: 18.w, height: 18.h, color: Colors.white),
                        SizedBox(width: 4.w),
                        Text(
                          'Week 1/4',
                          style: TextStyle(color: Colors.white, fontSize: 14.sp),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_drop_down, color: Colors.white, size: 24.sp),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              builder: (context) => const CalendarBottomSheet(),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(width: 18.w), // Invisible spacer to balance the layout
                  ],
                ),
                SizedBox(height: 10.h),
                // Date
                Text(
                  'Today, 22 Dec 2024',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 8.h),
                // Calendar days
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'M',
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    Text(
                      'TU',
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    Text(
                      'W',
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    Text(
                      'TH',
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    Text(
                      'F',
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    Text(
                      'SA',
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    Text(
                      'SU',
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                // Calendar dates
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                      child: Text(
                        '21',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.green, width: 2.w),
                      ),
                      child: Text(
                        '22',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                      child: Text(
                        '23',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                      child: Text(
                        '24',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                      child: Text(
                        '25',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                      child: Text(
                        '26',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                      child: Text(
                        '27',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                Center(
                  child: SizedBox(
                    width: 30.w,
                    child: Divider(color: Colors.grey[900], thickness: 3.h),
                  ),
                ),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Workouts',
                      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                    Row(
                      children: [
                        Image.asset(AppImages.sun, width: 22.w, height: 22.h, color: Colors.white),
                        SizedBox(width: 4.w),
                        Text(
                          '9°',
                          style: TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ],
                ),
                5.verticalSpace,
                // Workout card
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(8.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'December 22 - 25m - 30m',
                            style: TextStyle(color: Colors.white, fontSize: 14.sp),
                          ),
                          5.verticalSpace,
                          Text(
                            'Upper Body',
                            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                      Image.asset(AppImages.rightArrow, width: 18.w, height: 18.h, color: Colors.white),
                    ],
                  ),
                ),
                10.verticalSpace,
                Text(
                  'My Insights',
                  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500, color: Colors.white),
                ),
                5.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16.w),
                        height: 150.h,
                        decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(8.r)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '550',
                                  style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w500, color: Colors.white),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 4.h),
                                  child: Text(
                                    'Calories',
                                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '1950 Remaining',
                              style: TextStyle(color: Colors.grey[500], fontSize: 14.sp),
                            ),
                            20.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '0',
                                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                                ),
                                Text(
                                  '2500',
                                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            LinearProgressIndicator(
                              value: 550 / 2500,
                              backgroundColor: Colors.grey[800],
                              color: Colors.teal,
                              minHeight: 4.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16.w),
                        height: 150.h,
                        decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(8.r)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '75',
                                  style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 4.h),
                                  child: Text(
                                    ' kg',
                                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(AppImages.upArrow, height: 20.h, width: 20.w),
                                2.horizontalSpace,
                                Text(
                                  '+1.6kg',
                                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                                ),
                              ],
                            ),
                            22.verticalSpace,
                            Text(
                              'Weight',
                              style: TextStyle(color: Colors.white, fontSize: 20.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                  decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(8.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Text(
                          '0%',
                          style: TextStyle(color: Colors.blue, fontSize: 30.sp),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '2 L',
                                style: TextStyle(color: Colors.blue, fontSize: 14.sp),
                              ),
                              SizedBox(height: 8.h),
                              SizedBox(
                                height: 80.h,
                                width: 50.w,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: List.generate(
                                          12,
                                          (index) => Container(
                                            width: 4.w,
                                            height: 4.h,
                                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[600]),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                        child: Container(width: 20.w, height: 2.h, color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '0 L',
                                    style: TextStyle(color: Colors.blue, fontSize: 14.sp),
                                  ),
                                  SizedBox(width: 20.w),
                                  Text(
                                    '0ml',
                                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'Hydration',
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Log Now',
                        style: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(color: Colors.teal[900], borderRadius: BorderRadius.circular(4.r)),
                        child: Center(
                          child: Text(
                            '500 ml added to water log',
                            style: TextStyle(color: Colors.white, fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h), // Bottom padding
              ],
            ),
          ),
        ),
      ),
    );
  }
}
