import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "test03",
      home: new MyHomePager(),
    );
  }
}

class MyHomePager extends StatelessWidget {
  final List<Tab> mTabs = <Tab>[
    new Tab(text: 'Android'),
    new Tab(text: 'ios'),
    new Tab(text: 'Flutter'),
    new Tab(text: 'RN'),
    new Tab(text: 'Java'),
    new Tab(text: 'C'),
    new Tab(text: 'C++'),
    new Tab(text: 'Go'),
  ];

  @override
  Widget build(BuildContext context) {



    return new DefaultTabController(
        length: mTabs.length,
        child: new Scaffold(
          appBar: new AppBar(
            title: Text('tabBar'),
            bottom: new TabBar(
              tabs: mTabs,
              indicatorColor: Colors.red,
              isScrollable: true,
            ),
          ),
          body: new TabBarView(
              children: mTabs.map((Tab t) {
            return new Center(
              child: new Text(t.text),
            );
          }).toList()),
        ));
  }
}
