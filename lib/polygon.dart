import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myapp/Polygon_painter.dart';

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
  Colors.indigo
];

class Polygon extends StatefulWidget {
  Polygon({Key key, @required this.vertices}) : super(key: key);
  List<Offset> vertices;

  @override
  _PolygonState createState() => _PolygonState();
}

class _PolygonState extends State<Polygon> {
  List<Widget> dotHolder;
  Random random = new Random();
  int updatehitcount = 0;
  // double yPosition = 0;
  Color color;
  bool isPaintIn = false;

  void updateVertix(key, delta) {
    // updatehitcount++;
    int index = dotHolder.indexWhere((element) => element.key == key);

    widget.vertices[index] += delta;
    // print('update hit count: $updatehitcount');
    // print('dotHolder Length: ${dotHolder.length}');

    setState(() {});
  }

  void deleteVertex(key) {
    int index = dotHolder.indexWhere((element) => element.key == key);
    dotHolder.removeAt(index);
    widget.vertices.removeAt(index);
    setState(() {});
  }

  void addVertex() {}

  @override
  void initState() {
    color = colors[random.nextInt(colors.length - 1)];
    dotHolder = [];

    widget.vertices.forEach((element) {
      dotHolder.add(Dot(
        key: UniqueKey(),
        vertex: element,
        color: color,
        del: deleteVertex,
      ));

      // print('After dotHolder creation: ${dotHolder}');
    });
    // createNewDots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Size(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    if (!isPaintIn) {
      dotHolder.add(painterWidgetBuilder(size));
      isPaintIn = true;
    }

    return Stack(children: dotHolder);
  }

  Widget painterWidgetBuilder(Size size) {
    return IgnorePointer(
      ignoring: true,
      child: CustomPaint(
        size: size,
        painter: PolygonPainter(vertices: widget.vertices, color: color),
      ),
    );
  }
}
