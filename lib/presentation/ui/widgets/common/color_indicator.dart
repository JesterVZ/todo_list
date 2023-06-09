import 'package:flutter/material.dart';

class ColorIndicator extends StatelessWidget {
  final Color color;
  const ColorIndicator({super.key, required this.color});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 30,
        height: 30,
        child: CustomPaint(
          foregroundPainter: ColorIndicatorPainter(color: color),
        ),
      );
}

class ColorIndicatorPainter extends CustomPainter {
  final Color color;
  ColorIndicatorPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
