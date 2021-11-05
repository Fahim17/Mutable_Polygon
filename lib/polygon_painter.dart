import 'package:flutter/material.dart';

class PolygonPainter extends CustomPainter {
  List<Offset> vertices;
  Color color;

  PolygonPainter({this.vertices, this.color});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..isAntiAlias = true
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    for (int a = 0; a < vertices.length - 1; a++) {
      canvas.drawLine(vertices[a], vertices[a + 1], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  // void drawCrosshair(Offset endpoint, Canvas canvas, Size size) {
  //   var paint = Paint()
  //     ..color = Colors.blue
  //     ..isAntiAlias = true
  //     ..strokeWidth = 1
  //     ..strokeJoin = StrokeJoin.round;
  //
  //  //draw vertical Polygon
  //   var a1 = Offset(endpoint.dx, 0);
  //   var b1 = Offset(endpoint.dx, size.height);
  //   canvas.drawPolygon(a1, b1, paint);

  //   //draw horizontal Polygon
  //   var a2 = Offset(0, endpoint.dy);
  //   var b2 = Offset(size.width, endpoint.dy);
  //   canvas.drawPolygon(a2, b2, paint);
  // }
}
