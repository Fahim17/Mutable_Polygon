import 'package:flutter/material.dart';
import 'package:myapp/routeLeg.dart';

import 'dot.dart';

class Route3 extends StatefulWidget {
  List<Offset> vertices;
  List<Dot> dotHolder;
  List<RouteLeg> legs;

  Route3({Key key, this.vertices}) : super(key: key);

  @override
  _Route3State createState() => _Route3State();
}

class _Route3State extends State<Route3> {
  void addDot(Offset a) {
    widget.vertices.add(a);
    Dot temp = Dot(
      key: UniqueKey(),
      vertex: a,
      color: Colors.blue,
      del: deleteDot,
    );

    widget.dotHolder.add(temp);

    RouteLeg newLeg = RouteLeg(
        key: UniqueKey(),
        startPoint: widget.dotHolder[widget.vertices.length - 2].vertex,
        endPoint: widget.dotHolder[widget.vertices.length - 1].vertex,
        sStream: widget.dotHolder[widget.vertices.length - 2].stream,
        eStream: widget.dotHolder[widget.vertices.length - 1].stream);

    widget.legs.add(newLeg);
    setState(() {});
  }

  void deleteDot(key) {
    int index = widget.dotHolder.indexWhere((element) => element.key == key);

    if (index == 0) {
      if (widget.legs.length != 0) widget.legs.removeAt(index);
      widget.dotHolder.removeAt(index);
      widget.vertices.removeAt(index);
    } else if (index == widget.dotHolder.length - 1) {
      widget.legs.removeAt(index - 1);
      widget.dotHolder.removeAt(index);
      widget.vertices.removeAt(index);
    } else {
      RouteLeg newLeg = RouteLeg(
          key: UniqueKey(),
          startPoint: widget.dotHolder[index - 1].vertex,
          endPoint: widget.dotHolder[index + 1].vertex,
          sStream: widget.dotHolder[index - 1].stream,
          eStream: widget.dotHolder[index + 1].stream);

      widget.legs.removeAt(index - 1);
      widget.legs.removeAt(index - 1);
      widget.legs.insert(index - 1, newLeg);
      widget.dotHolder.removeAt(index);
      widget.vertices.removeAt(index);
    }

    setState(() {});
  }

  void updateDot(key, delta) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget.dotHolder = [];
    widget.legs = [];

    widget.vertices.forEach((element) {
      widget.dotHolder.add(Dot(
        key: UniqueKey(),
        vertex: element,
        color: Colors.blue,
        del: deleteDot,
      ));

      // print('After dotHolder creation: ${dotHolder}');
    });
    for (int e = 0; e < widget.vertices.length - 1; e++) {
      widget.legs.add(RouteLeg(
          key: UniqueKey(),
          startPoint: widget.dotHolder[e].vertex,
          endPoint: widget.dotHolder[e + 1].vertex,
          sStream: widget.dotHolder[e].stream,
          eStream: widget.dotHolder[e + 1].stream));
    }

    for (var i = 0; i < widget.vertices.length; i++) {
      print('vertex $i is ${widget.vertices[i]}');
      print('dot $i is ${widget.dotHolder[i].vertex}');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> allWidgets = [];
    allWidgets.addAll(widget.legs);
    allWidgets.addAll(widget.dotHolder);
    return Stack(
      children: allWidgets,
    );
  }
}
