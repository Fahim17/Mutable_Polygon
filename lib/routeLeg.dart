import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myapp/routeLeg_painter.dart';

class RouteLeg extends StatefulWidget {
  Stream<Offset> sStream;
  Stream<Offset> eStream;
  Offset startPoint;
  Offset endPoint;
  double height;
  double width;
  // RouteLegData data;
  RouteLeg(
      {Key key, this.startPoint, this.endPoint, this.sStream, this.eStream})
      : super(key: key) {}

  @override
  _RouteLegState createState() => _RouteLegState();
}

class _RouteLegState extends State<RouteLeg> {
  StreamSubscription<Offset> sStreamSub;
  StreamSubscription<Offset> eStreamSub;
  @override
  void initState() {
    super.initState();

    sStreamSub = widget.sStream.listen((data) {
      print('got the data: $data for key: $widget.key');
      widget.startPoint += data;
      setState(() {});
    });
    eStreamSub = widget.eStream.listen((data) {
      print('got the data: $data for key: $widget.key');
      widget.endPoint += data;
      setState(() {});
    });

    widget.width = 100;
  }

  @override
  void dispose() {
    sStreamSub.cancel();
    eStreamSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: (widget.endPoint - widget.startPoint).distance,
      width: widget.width,
      top: widget.startPoint.dy,
      left: widget.startPoint.dx - (widget.width / 2),
      child: Transform.rotate(
        angle: (widget.endPoint - widget.startPoint).direction - pi / 2,
        alignment: Alignment.topCenter,
        child: IgnorePointer(
          ignoring: true,
          child: CustomPaint(
            painter: RouteLegPainter(),
            child: Container(
              child: Center(child: Text(widget.toString())),
//                 color: Colors.transparent
            ),
          ),
        ),
      ),
    );
  }
}
