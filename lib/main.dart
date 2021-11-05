import 'package:flutter/material.dart';
import 'package:myapp/polygon.dart';
import 'package:myapp/route.dart';
import 'package:myapp/routeLeg.dart';
import 'dart:math';
import 'Line.dart';
import 'dot.dart';
import 'dart:async';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);
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
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> movableItems = [];
  Random random = new Random();
  Color color;
  bool createV = false;

  Widget gestureDetect = GestureDetector();

  @override
  Widget build(BuildContext context) {
    List<Offset> arr = [];
    for (int t = 0; t < 5; t++) {
      arr.add(Offset(random.nextInt(300).toDouble(),
          random.nextInt(700).toDouble() + 30.0));
    }

    return Scaffold(
        floatingActionButton: Column(children: [
          FloatingActionButton(
              child: Icon(Icons.person_add_alt),
              onPressed: () {
                createV = !createV;
              }),
          // FloatingActionButton(
          //   child: Icon(Icons.add_circle),
          //   onPressed: () {
          //     color = colors[random.nextInt(colors.length - 1)];
          //     setState(() {
          //       movableItems.add(Route3(key: UniqueKey(), vertices: arr));
          //       // movableItems.add(Dot(
          //       //   key: UniqueKey(),
          //       //   vertex: Offset(50, 100),
          //       //   color: color,
          //       // ));

          //       // movableItems.add(RouteLeg(
          //       //   key: UniqueKey(),
          //       // ));

          //       // movableItems.add(Polygon(key: UniqueKey(), vertices: arr));
          //       //
          //       //
          //       // movableItems.add(Line(
          //       //   key: UniqueKey(),
          //       //   del: removeS,
          //       // ));

          //       // arr.forEach((element) {
          //       //   movableItems.add(Dot(
          //       //     key: UniqueKey(),
          //       //     vertex: element,
          //       //     color: color,
          //       //   ));
          //       // });
          //     });
          //   },
          // ),
        ]),
        body: Container(
            // constraints: BoxConstraints.expand(),
            color: Colors.grey,
            child: Stack(
              children: movableItems,
            )));
  }
}
