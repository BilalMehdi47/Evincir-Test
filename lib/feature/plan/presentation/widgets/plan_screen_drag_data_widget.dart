import 'dart:ui';

class DragData {
  final String workoutId;
  final int fromDayIndex;

  DragData({required this.workoutId, required this.fromDayIndex});
}

class DayData {
  final String dayName;
  final String date;
  final List<WorkoutData> workouts;

  DayData({required this.dayName, required this.date, this.workouts = const []});
}

class WorkoutData {
  final String id;
  final String category;
  final String title;
  final String duration;
  final Color categoryColor;
  final String initial;

  WorkoutData({
    required this.id,
    required this.category,
    required this.title,
    required this.duration,
    required this.categoryColor,
    required this.initial,
  });
}
