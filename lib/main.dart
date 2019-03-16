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
  var _companies = [
    "test comp 11",
    "test comp 12",
    "test comp 13",
    "test comp 14",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test ex"),
      ),
      body: SafeArea(
        child: buildColumn(),
      ),
    );
  }

  Widget buildColumn() {
    return ListView(
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
                    imageUri: 'assets/iconproducts.png'),
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: CustomCard(
                    text: "گزارش آخرین دوره",
                    imageUri: 'assets/iconproducts.png'),
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
        Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
                children: _companies
                    .map(
                      (compName) => BuildInfoCard(
                            height: 150,
                            brandImage: BuildBrandImage(),
                            infoText: BuildInfoText(
                              topText: buildTextTop(compName),
                              midText: buildTextmid(),
                              botText: buildTextBottom(),
                            ),
                            productIcon: BuildProductIcon(
                              imageUri: 'assets/iconproducts.png',
                            ),
                          ),
                    )
                    .toList()))
      ],
    );
  }

  Text buildTextBottom() {
    return Text(
      "دوربین مداربسته #دوربین امنیتی #داهوا#",
      style: TextStyle(
          fontFamily: 'Iran',
          color: Color(0xFF82B2A8),
          fontSize: 12,
          fontWeight: FontWeight.bold),
    );
  }

  Text buildTextmid() {
    return Text(
      "عرضه کننده محصولات ایمنی و امنیتی",
      style: TextStyle(
          fontFamily: 'Iran',
          color: Colors.grey[500],
          fontSize: 15,
          fontWeight: FontWeight.bold),
    );
  }

  Text buildTextTop(String name) {
    return Text(
      name,
      style: TextStyle(
          fontFamily: 'Iran',
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );
  }
}

class BuildInfoCard extends StatelessWidget {
  final double height;
  final double width;
  final Color cardColor;
  final double cardRadius;
  final BuildInfoText infoText;
  final BuildProductIcon productIcon;
  final BuildBrandImage brandImage;

  BuildInfoCard(
      {Key key,
      this.height,
      this.width,
      this.cardColor = Colors.white,
      this.cardRadius = 8,
      this.infoText,
      this.productIcon,
      this.brandImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height,
        decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(cardRadius),
            boxShadow: [
              BoxShadow(
                  color: Colors.black54, blurRadius: 4, offset: Offset(0.7, 0.2))
            ]),
        child: Material(
          type: MaterialType.transparency,
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(cardRadius),
            onTap: () {},
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      infoText,
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10, left: 10),
                            child: brandImage,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, left: 10, right: 10),
                    child: productIcon,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildBrandImage extends StatelessWidget {
  BuildBrandImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset('assets/brandlogosample.png', scale: 2.1),
        Container(
          width: 10,
          height: 0,
        ),
        Image.asset('assets/brandlogosample.png', scale: 3)
      ],
    );
  }
}

class BuildInfoText extends StatelessWidget {
  final Text topText;
  final Text midText;
  final Text botText;

  const BuildInfoText(
      {Key key,
      @required this.topText,
      @required this.midText,
      @required this.botText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: topText,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: midText,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: botText,
          ),
        ],
      ),
    );
  }
}

class BuildProductIcon extends StatelessWidget {
  final String imageUri;

  BuildProductIcon({Key key, this.imageUri}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Container(
          width: 70,
          height: 70,
          decoration: new BoxDecoration(
            color: Colors.white70,
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 2,
                  offset: Offset(0.1, 0.4))
            ],
            shape: BoxShape.circle,
          ),
          child: ClipOval(
              child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Image.asset(
              imageUri,
              scale: 1.2,
            ),
          )),
        ),
      ],
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
