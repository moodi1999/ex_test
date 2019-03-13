import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test ex"),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: buildCard(),
          ),
        ),
      ),
    );
  }

  Widget buildCard() {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2,
                  spreadRadius: 2),
            ],
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Transform.scale(
                  scale: 3,
                  child: Transform.translate(
                    offset: Offset(43, 20),
                    child: Transform.rotate(
                      angle: -pi / 3.5,
                      child: Container(
                        color: const Color(0xFFF5F5F5),
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: buildDataRow(),
                ),
              ],
            ),
          )),
    );
  }

  Row buildDataRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text(
              "گزارش آخرین دوره",

              style: const TextStyle(
                  fontFamily: 'Iran',
                  fontSize: 16,
                  color: Color.fromARGB(255, 80, 80, 80)),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 26, left: 20),
            child: Image.asset('assets/iconnews_and_feed.png'),
          ),
        ),
      ],
    );
  }
}


class GradientButton extends StatelessWidget {
//
//  final Widget child;
//  final Gradient gradient;
//  final double width;
//  final double height;
//  final Function onPressed;



  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
