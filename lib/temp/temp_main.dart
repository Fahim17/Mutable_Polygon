// import 'package:flutter/material.dart';
// import 'package:myapp/polygon.dart';
// import 'dart:math';
// import 'Line.dart';
// import 'dot.dart';

// final Color darkBlue = Color.fromARGB(255, 18, 32, 47);
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
//   Colors.lime
// ];
// void main() {
//   runApp(MyApp());
//   // print(UniqueKey().toString());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
//       debugShowCheckedModeBanner: false,
//       home: HomeView(),
//     );
//   }
// }

// class HomeView extends StatefulWidget {
//   @override
//   _HomeViewState createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   List<Widget> movableItems = [];
//   Random random = new Random();
//   Color color;
//   void removeS(index) {
// //     print('widget er key:');

// //     print(index);
//     setState(() {
//       movableItems.removeWhere((item) => item.key == index);
//     });
// //     print('list a asche ei koyta: ');
// //     movableItems.forEach((i){
// //       print(i.key);
// //     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Offset> arr = [];
//     for (int t = 0; t < 5; t++) {
//       arr.add(Offset(random.nextInt(300).toDouble(),
//           random.nextInt(700).toDouble() + 30.0));
//     }

//     return Scaffold(
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add_box),
//           onPressed: () {
//             color = colors[random.nextInt(colors.length - 1)];
//             setState(() {
//               // movableItems.add(Polygon(key: UniqueKey(), vertices: arr));

//               arr.forEach((element) {
//                 movableItems.add(Dot(
//                   key: UniqueKey(),
//                   vertex: element,
//                   color: color,
//                 ));
//               });
//             });
//           },
//         ),
//         body: Container(
//             // constraints: BoxConstraints.expand(),
//             color: Colors.grey,
//             child: Stack(
//               children: movableItems,
//             )));
//   }
// }
