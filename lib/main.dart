import 'dart:math';
import 'package:ex_test/CustomAppBar.dart';
import 'package:ex_test/CustomSpceBar.dart';
import 'package:ex_test/FlexibleSpaceBarRTL.dart';
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
      debugShowCheckedModeBanner: false,
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
      body: buildColumn(),
    );
  }

  List<String> _tabs = ["همه", "خارجی", "داخلی", "تولید کننده", "صادرکننده"];

  Color white90 = Colors.white.withOpacity(0.95);
  BouncingScrollPhysics scrollPhysics = new BouncingScrollPhysics();

  Widget buildColumn() {
    return DefaultTabController(
      initialIndex: _tabs.length - 1,
      length: _tabs.length, // This is the number of tabs.
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // These are the slivers that show up in the "outer" scroll view.
          return <Widget>[
            SliverOverlapAbsorber(
              // This widget takes the overlapping behavior of the SliverAppBar,
              // and redirects it to the SliverOverlapInjector below. If it is
              // missing, then it is possible for the nested "inner" scroll view
              // below to end up under the SliverAppBar even when the inner
              // scroll view thinks it has not been scrolled.
              // This is not necessary if the "headerSliverBuilder" only builds
              // widgets that do not overlap the next sliver.
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: CustomSliverAppBar(
                backgroundColor: Colors.white,
                toolbarHeight: 56,
                // This is the title in the app bar.
                pinned: true,
                expandedHeight: 140.0,
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(30),
                            child: Icon(
                              IconData(59574, fontFamily: 'MaterialIcons'),
                              color: Colors.black,
                            ),
                          ),
                        )),
                  ),
                ],
                // The "forceElevated" property causes the SliverAppBar to show
                // a shadow. The "innerBoxIsScrolled" parameter is true when the
                // inner scroll view is scrolled beyond its "zero" point, i.e.
                // when it appears to be scrolled below the SliverAppBar.
                // Without this, there are cases where the shadow would appear
                // or not appear inappropriately, because the SliverAppBar is
                // not actually aware of the precise position of the inner
                // scroll views.
                flexibleSpace: CustomFlexibleSpaceBar (
                  title: Text(
                    "اسلیور تست",
                    style: TextStyle(fontFamily: 'Iran', color: Colors.black),


                  ),
                ),
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  labelPadding: EdgeInsets.only(left: 20, right: 20),
                  isScrollable: true,
                  labelColor: Colors.black,
                  indicatorWeight: 2,
                  indicatorColor: Colors.greenAccent,
                  indicator: CustomTabIndicator(),
                  indicatorSize: TabBarIndicatorSize.label,
                  // These are the widgets to put in each tab in the tab bar.
                  tabs: _tabs.reversed.map((String name) => Tab(child: Text(name, style: TextStyle(fontFamily: 'Iran'),))).toList(),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          // These are the contents of the tab views, below the tabs.
          children: _tabs.map((String name) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Builder(
                // This Builder is needed to provide a BuildContext that is "inside"
                // the NestedScrollView, so that sliverOverlapAbsorberHandleFor() can
                // find the NestedScrollView.
                builder: (BuildContext context) {
                  return CustomScrollView(
                    // The "controller" and "primary" members should be left
                    // unset, so that the NestedScrollView can control this
                    // inner scroll view.
                    // If the "controller" property is set, then this scroll
                    // view will not be associated with the NestedScrollView.
                    // The PageStorageKey should be unique to this ScrollView;
                    // it allows the list to remember its scroll position when
                    // the tab view is not on the screen.
                    key: PageStorageKey<String>(name),
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        // This is the flip side of the SliverOverlapAbsorber above.
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate([
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
                        ]),
                      )
                    ],
                  );
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  CustomScrollView buildCustomScrollView() {
    return CustomScrollView(
      physics: null,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          expandedHeight: 90,
          elevation: 0,
          pinned: true,
          floating: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(30),
                      child: Icon(
                        IconData(59574, fontFamily: 'MaterialIcons'),
                        color: Colors.black,
                      ),
                    ),
                  )),
            ),
          ],
          flexibleSpace: CustomFlexibleSpaceBar(
            title: Text(
              "اسلیور تست",
              style: TextStyle(fontFamily: 'Iran', color: Colors.black),
            ),
          ),
        ),
        CustomSliverAppBar(
          elevation: 6,
          toolbarHeight: 40,
          backgroundColor: white90,
          primary: false,
          pinned: true,
          floating: false,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          PageView(
            children: <Widget>[
              ListView(children: <Widget>[
                Column(
                  children: buildChildren(),
                ),
              ]),
              Column(
                children: buildChildren(),
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
          ),
        ])),
      ],
    );
  }

  List<Widget> buildChildren() {
    return <Widget>[
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
    ];
  }

  SliverList buildSliverList() {
    return SliverList(
        delegate: SliverChildListDelegate(
      [
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
    ));
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
                  color: Colors.black54,
                  blurRadius: 4,
                  offset: Offset(0.7, 0.2))
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
                            padding:
                                const EdgeInsets.only(bottom: 10, left: 10),
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
                    padding:
                        const EdgeInsets.only(top: 16, left: 10, right: 10),
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

class CustomTabIndicator extends Decoration {
  @override
  _CustomPainter createBoxPainter([VoidCallback onChanged]) {
    return new _CustomPainter(this, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  var indicatorHeight = 2.0;

  _CustomPainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);

    //offset is the position from where the decoration should be drawn.
    //configuration.size tells us about the height and width of the tab.
    final Rect rect = Offset(offset.dx - 5,
            (configuration.size.height / 1.3) - (indicatorHeight / 2)) &
        Size(configuration.size.width + 10, indicatorHeight);

    final Paint paint = Paint();
    paint.color = Colors.green;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(5.0)), paint);
  }
}
