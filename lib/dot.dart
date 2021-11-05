import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/dot_painter.dart';

class Dot extends StatefulWidget {
  Offset vertex;
  Color color;

  StreamController<Offset> _dotStreamComtroller;
  Stream<Offset> get stream => _dotStreamComtroller.stream;

  final Function(Key) del;

  Dot({Key key, this.del, this.vertex, this.color}) : super(key: key) {
    _dotStreamComtroller = StreamController<Offset>.broadcast();
  }

  @override
  _DotState createState() => _DotState();
}

class _DotState extends State<Dot> {
  Random random = new Random();
  double xPosition = 0;
  double yPosition = 0;
  // int updatehitcount = 0;

  @override
  void initState() {
    super.initState();
    xPosition = widget.vertex.dx;
    yPosition = widget.vertex.dy;
  }

  @override
  void dispose() {
    widget._dotStreamComtroller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Size(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    // print(size);

    //
    return Positioned(
      top: yPosition - 25,
      left: xPosition - 25,
      child: GestureDetector(
        onLongPress: () {
          // widget._dotStreamComtroller.close();
          widget.del(widget.key);
        },
        onPanUpdate: (details) {
          // updatehitcount++;
          xPosition += details.delta.dx;
          yPosition += details.delta.dy;

          widget.vertex += details.delta;

          widget._dotStreamComtroller.sink.add(details.delta);

          setState(() {});
          // print('update hit count: $updatehitcount');
        },
        child: Container(
          width: 50,
          height: 50,
          color: Colors.lightBlue,
          child: Center(
            child: CustomPaint(
//             size: Size(MediaQuery.of(context).size.width,
//                 MediaQuery.of(context).size.height),
              painter: DotPainter(vert: Offset(0, 0), color: widget.color),
//             child: Container(
//                 color: Colors.red[50],
//                 ),
            ),
          ),
        ),
      ),
    );
  }
}
