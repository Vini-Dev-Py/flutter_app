import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    title: 'Ecommerce',
    home: MyHomePage(),
  )
  );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin {
  TabController tabController;

  AnimationController _controller;

  static const List<IconData> icons = const [ FontAwesomeIcons.mapMarkedAlt ];
  static const List<IconData> icons_whatsapp = const [ FontAwesomeIcons.cogs ];
  static const List<IconData> icons_youtube = const [  FontAwesomeIcons.book ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = new TabController(length: 3, vsync: this, initialIndex: 1);

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

  }

  @override
  Widget build(BuildContext context) {

    final sizeConfig = MediaQuery.of(context).size.width;

    Widget  Bottom_Navigation_Bar = Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.up,
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
                width: sizeConfig,
                height: 40.0,
                color: const Color(0xffE78EA5),
                child: Container(
                  width: sizeConfig,
                  height: 40.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: (MediaQuery.of(context).size.width / 12))
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          height: 40.0,
                          child: Row(
                            children: [
                              Text("Produtos"),
                              IconButton(icon: FaIcon(FontAwesomeIcons.shoePrints, color: Color(0xffffffff)), onPressed: () {})
                            ],
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 30)
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          height: 40.0,
                          child: Row(
                            children: [
                              Text("Lista"),
                              IconButton(icon: FaIcon(FontAwesomeIcons.listAlt, color: Color(0xffffffff)), onPressed: () {})
                            ],
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 30)
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          height: 40.0,
                          child: Row(
                            children: [
                              Text("Comprar"),
                              IconButton(icon: FaIcon(FontAwesomeIcons.users, color: Color(0xffffffff)), onPressed: () {})
                            ],
                          )
                      ),
                    ],
                  ),
                )
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Controle de Estoque Sapatilhas"),
        leading: IconButton(icon: Icon(Icons.more_vert), onPressed: () {} ),
        centerTitle: true,
        backgroundColor: const Color(0xffE78EA5),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            icon: FaIcon(FontAwesomeIcons.user, color: Color(0xffffffff)),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(controller: tabController, indicatorWeight: 3, indicatorColor: const Color(0xffFF0789),tabs: <Widget>[
          SizedBox(
            child: Row(
              children: [
                Text("Estoque"),
                Padding(padding: EdgeInsets.all(1)),
                FaIcon(FontAwesomeIcons.cubes, color: Color(0xffffffff))
            ],
          )),
          SizedBox(
              child: Row(
                children: [
                  Text("Pagamentos"),
                  Padding(padding: EdgeInsets.all(1)),
                  FaIcon(FontAwesomeIcons.moneyBillAlt, color: Color(0xffffffff)),
                ],
              )),
          SizedBox(
              child: Row(
                children: [
                  Text("Encomendas"),
                  Padding(padding: EdgeInsets.all(1)),
                  FaIcon(FontAwesomeIcons.box, color: Color(0xffffffff))
                ],
              )),
        ]),
      ),
      backgroundColor: const Color(0xffefefef),
      body: TabBarView(controller: tabController ,children: <Widget>[
        Container(),
        Container(),
        Container()
      ]),
      bottomNavigationBar: Bottom_Navigation_Bar,
      floatingActionButton: new Column(
        mainAxisSize: MainAxisSize.min,
        children: new List.generate(icons.length, (int index) {
          Widget child = new Container(
            height: 220.0,
            width: 60.0,
            alignment: FractionalOffset.topCenter,
            child: new ScaleTransition(
                scale: new CurvedAnimation(
                  parent: _controller,
                  curve: new Interval(
                      0.0,
                      1.0 - index / icons.length / 2.0,
                      curve: Curves.easeOut
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    new FloatingActionButton(
                      heroTag: null,
                      backgroundColor: const Color(0xffE78EA5),
                      mini: false,
                      child: new Icon(icons[index], color: const Color(0xffffffff)),
                      onPressed: () {},
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10)
                    ),
                    new FloatingActionButton(
                      heroTag: null,
                      backgroundColor: const Color(0xffE78EA5),
                      mini: false,
                      child: new Icon(icons_whatsapp[index], color: const Color(0xffffffff)),
                      onPressed: () {},
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10)
                    ),
                    new FloatingActionButton(
                      heroTag: null,
                      backgroundColor: const Color(0xffE78EA5),
                      mini: false,
                      child: new Icon(icons_youtube[index], color: const Color(0xffffffff)),
                      onPressed: () {},
                    ),
                  ],
                )
            ),
          );
          return child;
        }).toList()..add(
          new FloatingActionButton(
            heroTag: null,
            child: new AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return new Transform(
                  transform: new Matrix4.rotationZ(_controller.value * 1.5 * math.pi),
                  alignment: FractionalOffset.center,
                  child: new Icon(_controller.isDismissed ? Icons.more_horiz : Icons.more_horiz, size: 42,),
                );
              },
            ),
            onPressed: () {
              if (_controller.isDismissed) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
            backgroundColor: const Color(0xffE78EA5),
          ),
        ),
      ),
    );
  }
}

