import 'package:evencir_test/feature/home/presentation/widgets/calemdar_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/app_images.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
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
                    Image.asset(
                      AppImages.bellIcon,
                      width: 18.w,
                      height: 18.h,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          AppImages.timer,
                          width: 18.w,
                          height: 18.h,
                          color: isDarkMode ? Colors.white : Colors.black87,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Week 1/4',
                          style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 14.sp),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: isDarkMode ? Colors.white : Colors.black87,
                            size: 24.sp,
                          ),
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
                    SizedBox(width: 18.w),
                  ],
                ),
                SizedBox(height: 10.h),
                // Date
                Text(
                  'Today, 22 Dec 2024',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                SizedBox(height: 8.h),
                // Calendar days
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'M',
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 12.sp),
                    ),
                    Text(
                      'TU',
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 12.sp),
                    ),
                    Text(
                      'W',
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 12.sp),
                    ),
                    Text(
                      'TH',
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 12.sp),
                    ),
                    Text(
                      'F',
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 12.sp),
                    ),
                    Text(
                      'SA',
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 12.sp),
                    ),
                    Text(
                      'SU',
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 12.sp),
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
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDarkMode ? Colors.black : Colors.white,
                      ),
                      child: Text(
                        '21',
                        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 14.sp),
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
                        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 14.sp),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDarkMode ? Colors.black : Colors.white,
                      ),
                      child: Text(
                        '23',
                        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 14.sp),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDarkMode ? Colors.black : Colors.white,
                      ),
                      child: Text(
                        '24',
                        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 14.sp),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDarkMode ? Colors.black : Colors.white,
                      ),
                      child: Text(
                        '25',
                        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 14.sp),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDarkMode ? Colors.black : Colors.white,
                      ),
                      child: Text(
                        '26',
                        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 14.sp),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDarkMode ? Colors.black : Colors.white,
                      ),
                      child: Text(
                        '27',
                        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                Center(
                  child: SizedBox(
                    width: 30.w,
                    child: Divider(color: isDarkMode ? Colors.grey[900] : Colors.grey[300], thickness: 3.h),
                  ),
                ),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Workouts',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          AppImages.sun,
                          width: 22.w,
                          height: 22.h,
                          color: isDarkMode ? Colors.white : Colors.black87,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          '9°',
                          style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ],
                ),
                5.verticalSpace,
                // Workout card
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.grey[900] : Colors.grey[100],
                    borderRadius: BorderRadius.circular(8.r),
                    border: isDarkMode ? null : Border.all(color: Colors.grey[300]!, width: 0.5.w),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'December 22 - 25m - 30m',
                            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 14.sp),
                          ),
                          5.verticalSpace,
                          Text(
                            'Upper Body',
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.white : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        AppImages.rightArrow,
                        width: 18.w,
                        height: 18.h,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,
                Text(
                  'My Insights',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                5.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: isDarkMode ? Colors.grey[900] : Colors.grey[100],
                          borderRadius: BorderRadius.circular(8.r),
                          border: isDarkMode ? null : Border.all(color: Colors.grey[300]!, width: 0.5.w),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '550',
                                  style: TextStyle(
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.w500,
                                    color: isDarkMode ? Colors.white : Colors.black87,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 2.h),
                                  child: Text(
                                    'Calories',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: isDarkMode ? Colors.white : Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '1950 Remaining',
                              style: TextStyle(
                                color: isDarkMode ? Colors.grey[500] : Colors.grey[600],
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '0',
                                  style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 10.sp),
                                ),
                                Text(
                                  '2500',
                                  style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 10.sp),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            LinearProgressIndicator(
                              value: 550 / 2500,
                              backgroundColor: isDarkMode ? Colors.grey[800] : Colors.grey[300],
                              color: Colors.teal,
                              minHeight: 3.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: isDarkMode ? Colors.grey[900] : Colors.grey[100],
                          borderRadius: BorderRadius.circular(8.r),
                          border: isDarkMode ? null : Border.all(color: Colors.grey[300]!, width: 0.5.w),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '75',
                                  style: TextStyle(
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode ? Colors.white : Colors.black87,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 2.h),
                                  child: Text(
                                    ' kg',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: isDarkMode ? Colors.white : Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(AppImages.upArrow, height: 16.h, width: 16.w),
                                2.horizontalSpace,
                                Text(
                                  '+1.6kg',
                                  style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 10.sp),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              'Weight',
                              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.grey[900] : Colors.grey[100],
                    borderRadius: BorderRadius.circular(8.r),
                    border: isDarkMode ? null : Border.all(color: Colors.grey[300]!, width: 0.5.w),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '0%',
                        style: TextStyle(color: Colors.blue, fontSize: 24.sp),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '2 L',
                                style: TextStyle(color: Colors.blue, fontSize: 12.sp),
                              ),
                              SizedBox(height: 6.h),
                              SizedBox(
                                height: 60.h,
                                width: 40.w,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: List.generate(
                                          10,
                                          (index) => Container(
                                            width: 3.w,
                                            height: 3.h,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: isDarkMode ? Colors.grey[600] : Colors.grey[400],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                        child: Container(width: 16.w, height: 2.h, color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '0 L',
                                    style: TextStyle(color: Colors.blue, fontSize: 12.sp),
                                  ),
                                  SizedBox(width: 16.w),
                                  Text(
                                    '0ml',
                                    style: TextStyle(
                                      color: isDarkMode ? Colors.white : Colors.black87,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Hydration',
                        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 18.sp),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Log Now',
                        style: TextStyle(color: isDarkMode ? Colors.grey[400] : Colors.grey[600], fontSize: 12.sp),
                      ),
                      SizedBox(height: 6.h),
                      Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                          color: isDarkMode ? Colors.teal[900] : Colors.teal[100],
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Center(
                          child: Text(
                            '500 ml added to water log',
                            style: TextStyle(color: isDarkMode ? Colors.white : Colors.teal[900], fontSize: 12.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
