import 'package:evencir_test/feature/plan/presentation/plan_screen_drag_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  List<DayData> weekDays = [
    DayData(
      dayName: 'Mon',
      date: '8',
      workouts: [
        WorkoutData(
          id: '1',
          category: '💪 Arms Workout',
          title: 'Arm Blaster',
          duration: '25m - 30m',
          categoryColor: const Color(0xFF4CAF50),
          initial: 'R',
        ),
      ],
    ),
    DayData(dayName: 'Tue', date: '9'),
    DayData(dayName: 'Wed', date: '10'),
    DayData(
      dayName: 'Thu',
      date: '11',
      workouts: [
        WorkoutData(
          id: '2',
          category: '🦵 Leg Workout',
          title: 'Leg Day Blitz',
          duration: '25m - 30m',
          categoryColor: const Color(0xFF5C6BC0),
          initial: 'A',
        ),
      ],
    ),
    DayData(dayName: 'Fri', date: '12'),
    DayData(dayName: 'Sat', date: '13'),
    DayData(dayName: 'Sun', date: '14'),
  ];

  void _moveWorkout(String workoutId, int fromDayIndex, int toDayIndex) {
    setState(() {
      final workout = weekDays[fromDayIndex].workouts.firstWhere((w) => w.id == workoutId);
      weekDays[fromDayIndex].workouts.removeWhere((w) => w.id == workoutId);
      weekDays[toDayIndex].workouts.add(workout);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0.04.sh),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                'Training Calendar',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  letterSpacing: -0.5.w,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 11.w),
              height: 3.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF5C6BC0), Color(0xFF3F51B5)],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Week 2/8',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      letterSpacing: -0.3.w,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'December 8-14',
                    style: TextStyle(fontSize: 15.sp, color: const Color(0xFF8E8E93), fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Total: 60min',
                    style: TextStyle(fontSize: 15.sp, color: const Color(0xFF8E8E93), fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: weekDays.length,
                separatorBuilder: (context, index) =>
                    Divider(height: 1.h, thickness: 1.h, color: const Color(0xFF1F1F21)),
                itemBuilder: (context, index) {
                  return _buildDayItem(weekDays[index], index);
                },
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 11.w),
              height: 3.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF26A69A), Color(0xFF00897B)],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Week 2',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      letterSpacing: -0.3.w,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'December 14-22',
                    style: TextStyle(fontSize: 15.sp, color: const Color(0xFF8E8E93), fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Total: 60min',
                    style: TextStyle(fontSize: 15.sp, color: const Color(0xFF8E8E93), fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4.h),
            Center(
              child: SizedBox(
                width: 200.w,
                child: Divider(color: Colors.grey[900], thickness: 1.h),
              ),
            ),
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }

  Widget _buildDayItem(DayData day, int dayIndex) {
    final daySlotHeight = 65.h;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 44.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  day.dayName,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: const Color(0xFF8E8E93),
                    fontWeight: FontWeight.w400,
                    height: 1.2.h,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  day.date,
                  style: TextStyle(
                    fontSize: 32.sp,
                    color: const Color(0xFF636366),
                    fontWeight: FontWeight.w300,
                    height: 1.0.h,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 24.w),
          Expanded(
            child: DragTarget<DragData>(
              onWillAccept: (data) => data != null,
              onAccept: (data) {
                _moveWorkout(data.workoutId, data.fromDayIndex, dayIndex);
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  constraints: BoxConstraints(minHeight: daySlotHeight),
                  decoration: BoxDecoration(
                    border: candidateData.isNotEmpty
                        ? Border.all(color: const Color(0xFF5C6BC0).withOpacity(0.5), width: 2.w)
                        : null,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: day.workouts.isEmpty
                      ? Center(
                          child: candidateData.isNotEmpty
                              ? Icon(
                                  Icons.add_circle_outline,
                                  color: const Color(0xFF5C6BC0).withOpacity(0.5),
                                  size: 32.sp,
                                )
                              : SizedBox(height: daySlotHeight),
                        )
                      : Column(children: day.workouts.map((workout) => _buildWorkoutCard(workout, dayIndex)).toList()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutCard(WorkoutData workout, int dayIndex) {
    final cardHeight = 65.h;

    return LongPressDraggable<DragData>(
      data: DragData(workoutId: workout.id, fromDayIndex: dayIndex),
      feedback: Material(
        color: Colors.transparent,
        child: Opacity(
          opacity: 0.95,
          child: SizedBox(width: 0.8.sw, height: cardHeight, child: _workoutCardStack(workout)),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: SizedBox(height: cardHeight, child: _workoutCardStack(workout)),
      ),
      child: SizedBox(height: cardHeight, child: _workoutCardStack(workout)),
    );
  }

  Widget _workoutCardStack(WorkoutData workout) {
    final pillWidth = 14.w;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: -pillWidth / 2,
          top: 1.h,
          bottom: 1.h,
          child: Container(
            width: pillWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), bottomLeft: Radius.circular(8.r)),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(color: const Color(0xFF2C2C2E), borderRadius: BorderRadius.circular(6.r)),
          child: _buildWorkoutContent(workout),
        ),
      ],
    );
  }

  Widget _buildWorkoutContent(WorkoutData workout) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 3.w,
                  height: 3.w,
                  decoration: const BoxDecoration(color: Color(0xFF636366), shape: BoxShape.circle),
                ),
                SizedBox(width: 4.w),
                Container(
                  width: 3.w,
                  height: 3.w,
                  decoration: const BoxDecoration(color: Color(0xFF636366), shape: BoxShape.circle),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 3.w,
                  height: 3.w,
                  decoration: const BoxDecoration(color: Color(0xFF636366), shape: BoxShape.circle),
                ),
                SizedBox(width: 4.w),
                Container(
                  width: 3.w,
                  height: 3.w,
                  decoration: const BoxDecoration(color: Color(0xFF636366), shape: BoxShape.circle),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 3.w,
                  height: 3.w,
                  decoration: const BoxDecoration(color: Color(0xFF636366), shape: BoxShape.circle),
                ),
                SizedBox(width: 4.w),
                Container(
                  width: 3.w,
                  height: 3.w,
                  decoration: const BoxDecoration(color: Color(0xFF636366), shape: BoxShape.circle),
                ),
              ],
            ),
          ],
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                workout.category,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: workout.categoryColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.1.w,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 3.h),
              Text(
                workout.title,
                style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.2.w,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Text(
          workout.duration,
          style: TextStyle(fontSize: 15.sp, color: const Color(0xFF8E8E93), fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}


