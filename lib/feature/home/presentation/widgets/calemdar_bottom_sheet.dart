import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarBottomSheet extends StatefulWidget {
  const CalendarBottomSheet({super.key});

  @override
  _CalendarBottomSheetState createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<CalendarBottomSheet> {
  late DateTime _selectedMonth;
  late DateTime _today;

  @override
  void initState() {
    super.initState();
    _today = DateTime.now();
    _selectedMonth = DateTime(_today.year, _today.month, 1);
  }

  void _previousMonth() {
    setState(() {
      _selectedMonth = DateTime(_selectedMonth.year, _selectedMonth.month - 1, 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _selectedMonth = DateTime(_selectedMonth.year, _selectedMonth.month + 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    String monthName = _getMonthName(_selectedMonth.month);
    int year = _selectedMonth.year;

    return Container(
      height: 0.5.sh,
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.black : Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: isDarkMode
            ? null
            : [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10.r, offset: Offset(0, -2.h))],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Grabber
          Container(
            width: 40.w,
            height: 4.h,
            margin: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.grey[600] : Colors.grey[400],
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          // Header with navigation
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.chevron_left, color: isDarkMode ? Colors.white : Colors.black87, size: 24.sp),
                  onPressed: _previousMonth,
                  padding: EdgeInsets.all(8.w),
                  constraints: BoxConstraints(minWidth: 40.w, minHeight: 40.h),
                ),
                Text(
                  '$monthName $year',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                    letterSpacing: 0.5.w,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.chevron_right, color: isDarkMode ? Colors.white : Colors.black87, size: 24.sp),
                  onPressed: _nextMonth,
                  padding: EdgeInsets.all(8.w),
                  constraints: BoxConstraints(minWidth: 40.w, minHeight: 40.h),
                ),
              ],
            ),
          ),
          // Weekday headers
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['M', 'T', 'W', 'T', 'F', 'S', 'S']
                  .map(
                    (day) => Expanded(
                      child: Center(
                        child: Text(
                          day,
                          style: TextStyle(
                            color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(height: 12.h),
          // Calendar grid
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 7,
                childAspectRatio: 1.0,
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 4.w,
                children: _buildCalendarDays(isDarkMode),
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  List<Widget> _buildCalendarDays(bool isDarkMode) {
    List<Widget> days = [];
    DateTime firstDayOfMonth = _selectedMonth;
    int weekdayOfFirst = firstDayOfMonth.weekday;
    int daysInMonth = DateTime(_selectedMonth.year, _selectedMonth.month + 1, 0).day;

    // Add blanks before the first day
    int blanks = weekdayOfFirst - 1;
    for (int i = 0; i < blanks; i++) {
      days.add(SizedBox());
    }

    for (int day = 1; day <= daysInMonth; day++) {
      DateTime thisDate = DateTime(_selectedMonth.year, _selectedMonth.month, day);
      bool isToday = thisDate.year == _today.year && thisDate.month == _today.month && thisDate.day == _today.day;

      days.add(
        Center(
          child: Container(
            width: 36.w,
            height: 36.h,
            decoration: isToday
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green, width: 2.w),
                  )
                : null,
            child: Center(
              child: Text(
                '$day',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black87,
                  fontSize: 16.sp,
                  fontWeight: isToday ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return days;
  }

  String _getMonthName(int month) {
    const List<String> months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month];
  }
}
