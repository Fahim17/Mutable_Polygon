import 'package:flutter/material.dart';

class DotPainter extends CustomPainter {
  Offset vert;
  Color color;

  DotPainter({this.vert, this.color});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..isAntiAlias = true
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(vert, 15, paint);
    // print('size of dot canvas: ${size.toString()}');
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  // void drawCrosshair(Offset endpoint, Canvas canvas, Size size) {
  //   var paint = Paint()
  //     ..color = Colors.blue
  //     ..isAntiAlias = true
  //     ..strokeWidth = 1
  //     ..strokeJoin = StrokeJoin.round;
  //   //draw vertical line
  //   var a1 = Offset(endpoint.dx, 0);
  //   var b1 = Offset(endpoint.dx, size.height);
  //   canvas.drawLine(a1, b1, paint);

  //   //draw horizontal line
  //   var a2 = Offset(0, endpoint.dy);
  //   var b2 = Offset(size.width, endpoint.dy);
  //   canvas.drawLine(a2, b2, paint);
  // }
}
