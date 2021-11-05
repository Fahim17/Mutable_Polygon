import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/dot_painter.dart';
import 'package:myapp/line_painter.dart';

import 'dot.dart';

List colors = [
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.black,
  Colors.blue,
  Colors.brown,
  Colors.cyan,
  Colors.deepPurple,
  Colors.indigo,
  Colors.pink,
  Colors.teal,
  Colors.orange,
  Colors.lime
];

class Line extends StatefulWidget {
  Line({Key key, this.del}) : super(key: key);
  final Function(Key) del;

  Offset p1 = Offset(150, 150);
  Offset p2 = Offset(300, 300);

  @override
  _LineState createState() => _LineState();
}

class _LineState extends State<Line> {
  Random random = new Random();
  double xPosition = 0;
  double yPosition = 0;
  Color color;
  int updatehitcount = 0;

  @override
  void initState() {
    color = colors[random.nextInt(colors.length - 1)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Size(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return Stack(children: <Widget>[
      IgnorePointer(
        ignoring: true,
        child: Container(
          // color: Colors.blueAccent,
          child: CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height),
            painter: LinePainter(
                vertex1: widget.p1, vertex2: widget.p2, color: color),
          ),
        ),
      ),
      Positioned(
        top: widget.p1.dy - 25,
        left: widget.p1.dx - 25,
        child: GestureDetector(
          onLongPress: () {
            widget.del(widget.key);
          },
          onPanUpdate: (details) {
            updatehitcount++;
            widget.p1 += details.delta;
            setState(() {});
            print('update hit count: $updatehitcount');
            // print('p1: ${widget.p1}');
          },
          child: Container(
            width: 50,
            height: 50,
            // color: Colors.pinkAccent,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height),
              painter: DotPainter(vert: Offset(25, 25), color: color),
            ),
          ),
        ),
      ),
      Positioned(
        top: widget.p2.dy - 25,
        left: widget.p2.dx - 25,
        child: GestureDetector(
          onLongPress: () {
            widget.del(widget.key);
          },
          onPanUpdate: (details) {
            updatehitcount++;
            widget.p2 += details.delta;
            setState(() {});
            print('update hit count: $updatehitcount');
            // print('p2: ${widget.p2}');
          },
          child: Container(
            width: 50,
            height: 50,
            // color: Colors.pinkAccent,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height),
              painter: DotPainter(vert: Offset(25, 25), color: color),
            ),
          ),
        ),
      ),
    ]);
  }
}
