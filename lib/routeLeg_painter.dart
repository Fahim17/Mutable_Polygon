import 'package:flutter/material.dart';

class RouteLegPainter extends CustomPainter {
  Offset p1;
  Offset p2;
  @override
  void paint(Canvas canvas, Size size) {
    p1 = Offset(size.width / 2, 0);
    p2 = Offset(size.width / 2, size.height);
    // print(p1);
    // print(p2);

    var pointPaint = Paint()
      ..color = Colors.purple
      ..isAntiAlias = true
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    var linePaint = Paint()
      ..color = Colors.cyan
      ..isAntiAlias = true
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(p1, 5, pointPaint);
    canvas.drawCircle(p2, 5, pointPaint);
    canvas.drawLine(p1, p2, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
