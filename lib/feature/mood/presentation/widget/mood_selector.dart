import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_images.dart';

class MoodCircleSelector extends StatefulWidget {
  final double value;
  final ValueChanged<double> onValueChanged;
  final double imageSize;

  const MoodCircleSelector({required this.value, required this.onValueChanged, this.imageSize = 100, super.key});

  @override
  _MoodCircleSelectorState createState() => _MoodCircleSelectorState();
}

class _MoodCircleSelectorState extends State<MoodCircleSelector> {
  final GlobalKey _key = GlobalKey();
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  void _updateValue(Offset position, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final dx = position.dx - center.dx;
    final dy = position.dy - center.dy;
    double angle = atan2(dy, dx);
    if (angle < 0) angle += 2 * pi;
    final newValue = angle / (2 * pi);
    widget.onValueChanged(newValue);
    setState(() {
      _currentValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final circleSize = 200.w;
    final circleRadius = circleSize / 2;
    final selectorRadius = 80.w;
    final handleSize = 30.w;

    return GestureDetector(
      key: _key,
      onPanStart: (details) {
        RenderBox box = _key.currentContext!.findRenderObject() as RenderBox;
        final position = box.globalToLocal(details.globalPosition);
        final size = box.size;
        _updateValue(position, size);
      },
      onPanUpdate: (details) {
        RenderBox box = _key.currentContext!.findRenderObject() as RenderBox;
        final position = box.globalToLocal(details.globalPosition);
        final size = box.size;
        _updateValue(position, size);
      },
      child: SizedBox(
        width: circleSize,
        height: circleSize,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(size: Size(circleSize, circleSize), painter: GradientRingPainter()),
            SizedBox(
              width: circleSize,
              height: circleSize,
              child: Center(
                child: Image.asset(_getEmoji(), width: widget.imageSize.w, height: widget.imageSize.h),
              ),
            ),
            Positioned(
              left: circleRadius + selectorRadius * cos(_currentValue * 2 * pi) - handleSize / 2,
              top: circleRadius + selectorRadius * sin(_currentValue * 2 * pi) - handleSize / 2,
              child: Container(
                width: handleSize,
                height: handleSize,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.8), shape: BoxShape.circle),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getEmoji() {
    if (_currentValue < 0.25) return AppImages.content;
    if (_currentValue < 0.5) return AppImages.peaceful;
    if (_currentValue < 0.75) return AppImages.happy;
    return AppImages.calm;
  }
}

class GradientRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10.w; // Responsive stroke adjustment
    final rect = Rect.fromCircle(center: center, radius: radius);
    final gradient = SweepGradient(
      colors: [Colors.purple, Colors.pinkAccent, Colors.orange, Colors.teal],
      stops: [0.0, 0.25, 0.5, 0.75],
    );
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.w; // Responsive stroke width
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
