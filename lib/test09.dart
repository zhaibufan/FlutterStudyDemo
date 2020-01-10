import 'dart:async';
import 'dart:core' as prefix0;
import 'dart:core';
import 'package:flutter/material.dart';

///拦截应用中所有调用print输出日志的行为
void main() {
  runZoned(
    () => runApp(MyApp()),
    zoneSpecification: new ZoneSpecification(
        print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
      parent.print(zone, "Intercepted: $line");
    }),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ii',
      home: Scaffold(
        appBar: AppBar(
          title: Text('runZoned'),
        ),
        body: new Center(
          child: RaisedButton(
            onPressed: () => {
              prefix0.print("click")
            },
            child: Text('click'),
          ),
        ),
      ),
    );
  }
}
