// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:myapp/dot_painter.dart';

// class Dot extends StatefulWidget {
//   Dot({Key key, this.del, this.vertex, this.color, this.update})
//       : super(key: key);
//   Offset vertex;
//   Color color;
//   final Function(Key) del;
//   final Function(Key, Offset) update;

//   @override
//   _DotState createState() => _DotState();
// }

// class _DotState extends State<Dot> {
//   Random random = new Random();
//   double xPosition = 0;
//   double yPosition = 0;
//   // int updatehitcount = 0;

//   @override
//   void initState() {
//     xPosition = widget.vertex.dx;
//     yPosition = widget.vertex.dy;

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = Size(
//         MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
//     // print(size);

//     //
//     return Positioned(
//       top: yPosition - 25,
//       left: xPosition - 25,
//       child: GestureDetector(
//         onLongPress: () {
//           widget.del(widget.key);
//         },
//         onPanUpdate: (tapInfo) {
//           // updatehitcount++;
//           xPosition += tapInfo.delta.dx;
//           yPosition += tapInfo.delta.dy;
//           widget.update(widget.key, tapInfo.delta);
//           setState(() {});
//           // print('update hit count: $updatehitcount');
//         },
//         child: Container(
//           width: 50,
//           height: 50,
//           color: Colors.lightBlue,
//           child: Center(
//             child: CustomPaint(
// //             size: Size(MediaQuery.of(context).size.width,
// //                 MediaQuery.of(context).size.height),
//               painter: DotPainter(vert: Offset(0, 0), color: widget.color),
// //             child: Container(
// //                 color: Colors.red[50],
// //                 ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
