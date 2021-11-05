// import 'dart:math';
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:myapp/Polygon_painter.dart';

// import 'dot.dart';
// import 'dot_painter.dart';

// List colors = [
//   Colors.red,
//   Colors.green,
//   Colors.yellow,
//   Colors.black,
//   Colors.blue,
//   Colors.brown,
//   Colors.cyan,
//   Colors.deepPurple,
//   Colors.indigo,
//   Colors.pink,
//   Colors.teal,
//   Colors.orange,
//   Colors.indigo
// ];

// class Polygon extends StatefulWidget {
//   Polygon({Key key, @required this.vertices}) : super(key: key);
//   List<Offset> vertices;

//   @override
//   _PolygonState createState() => _PolygonState();
// }

// class _PolygonState extends State<Polygon> {
//   List<Widget> dotHolder;
//   Random random = new Random();
//   int updatehitcount = 0;
//   Color color;

//   @override
//   void initState() {
//     color = colors[random.nextInt(colors.length - 1)];
//     dotHolder = [];

//     // widget.vertices.forEach((element) {
//     //   dotHolder.add(Dot(
//     //       key: UniqueKey(),
//     //       vertex: element,
//     //       color: color,
//     //       del: deleteVertex,
//     //       update: updateVertix));

//     //   // print('After dotHolder creation: ${dotHolder}');
//     // });
//     // createNewDots();

//     for (var i = 0; i < widget.vertices.length; i++) {
//       dotHolder.add(dotWidgetBuilder(context, i));
//     }

//     super.initState();
//   }

//   Widget dotWidgetBuilder(BuildContext context, int index) {
//     return Positioned(
//       top: widget.vertices[index].dy - 25,
//       left: widget.vertices[index].dx - 25,
//       child: GestureDetector(
//         // onLongPress: () {
//         //   widget.del(widget.key);
//         // },
//         onPanUpdate: (tapInfo) {
//           updatehitcount++;
//           widget.vertices[index] += tapInfo.delta;
//           // widget.update(widget.key, tapInfo.delta);
//           setState(() {});
//           print('update hit count: $updatehitcount');
//         },
//         child: Container(
//           width: 50,
//           height: 50,
//           color: Colors.lightBlue,
//           child: Center(
//             child: CustomPaint(
// //             size: Size(MediaQuery.of(context).size.width,
// //                 MediaQuery.of(context).size.height),
//               painter: DotPainter(vert: Offset(0, 0), color: color),
// //             child: Container(
// //                 color: Colors.red[50],
// //                 ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void updateVertix(key, delta) {
//     updatehitcount++;
//     // int index = dotHolder.indexWhere((element) => element.key == key);
//     int index = 0;
//     for (index = 0; index < dotHolder.length; index++) {
//       if (dotHolder[index].key == key) {
//         print(index);
//         break;
//       }
//     }

//     widget.vertices[index] += delta;
//     print('update hit count: $updatehitcount');

//     // if (updatehitcount > 2000) {
//     //   updatehitcount = 0;
//     //   dotHolder.clear();
//     //   createNewDots();
//     // }

//     setState(() {});
//   }

//   void deleteVertex(key) {
//     int index = dotHolder.indexWhere((element) => element.key == key);
//     dotHolder.removeAt(index);
//     widget.vertices.removeAt(index);
//     setState(() {});
//   }

//   void addVertex() {}

//   @override
//   Widget build(BuildContext context) {
//     Size size = Size(
//         MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

//     Widget paintingWidget = IgnorePointer(
//       ignoring: true,
//       child: CustomPaint(
//         size: Size(MediaQuery.of(context).size.width,
//             MediaQuery.of(context).size.height),
//         painter: PolygonPainter(vertices: widget.vertices, color: color),
//       ),
//     );

//     dotHolder.add(paintingWidget);

//     return Stack(children: dotHolder);
//   }
// }
