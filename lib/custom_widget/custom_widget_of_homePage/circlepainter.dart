import 'dart:math';
import 'package:flutter/material.dart';

class GlowingHexagon extends StatelessWidget {
  final double size;
  final Color color;

  const GlowingHexagon({
    Key? key,
    this.size = 25,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _HexagonPainter(color),
    );
  }
}

class _HexagonPainter extends CustomPainter {
  final Color color;

  _HexagonPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10);

    final path = Path();
    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < 6; i++) {
      final angle = (pi / 3 * i) - pi / 6;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      if (i == 0)
        path.moveTo(x, y);
      else
        path.lineTo(x, y);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
