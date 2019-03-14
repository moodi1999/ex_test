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
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: CustomCard(
                        text: "گزارش آخرین دوره",
                        imageUri: 'assets/iconnews_and_feed.png'),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: CustomCard(
                        text: "گزارش آخرین دوره",
                        imageUri: 'assets/iconnews_and_feed.png'),
                  ),
                )
              ],
            ),
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: CustomCard(
                    text: "گزارش آخرین دوره",
                    imageUri: 'assets/iconnews_and_feed.png'),
              ),
            ),
            Center(
              child: CustomCard(
                  text: "خدمات ویژه نمایشگاه",
                  imageUri: 'assets/iconproducts.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GradientButton(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "خرید کتاب نمایشگاه",
                    style: TextStyle(
                        fontFamily: "Iran", color: Colors.white, fontSize: 19),
                  ),
                ),
                onPressed: () {},
                gradient: LinearGradient(
                    colors: <Color>[Color(0xFF05D3B4), Color(0xFF63E0A2)],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String text;
  final String imageUri;

  CustomCard({Key key, this.text, this.imageUri}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildCard();
  }

  Widget buildCard() {
    return Container(
        width: double.infinity,
        height: 70,
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
                  offset: Offset(32, 20),
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
              Material(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
                color: Colors.transparent,
              )
            ],
          ),
        ));
  }

  Row buildDataRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              text,
              textAlign: TextAlign.right,
              style: const TextStyle(
                  fontFamily: 'Iran',
                  fontSize: 14,
                  color: Color.fromARGB(255, 80, 80, 80)),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              imageUri,
              width: 40,
            ),
          ),
        ),
      ],
    );
  }
}

class GradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  GradientButton(
      {Key key,
      this.child,
      this.gradient,
      this.width,
      this.height,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0.2, 0.6),
                  blurRadius: 2)
            ]),
        child: Material(
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {},
              splashColor: Colors.white54,
              child: new Container(
                width: double.infinity,
                height: double.infinity,
                child: child,
              ),
            ),
            color: Colors.transparent));
  }
}
