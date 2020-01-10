import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';

///异常捕获与上报
void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    reportErrorAndLog(details);
  };
  runZoned(
    () => runApp(MyApp()),
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        collectLog(line); // 收集日志
      },
    ),
    onError: (Object obj, StackTrace stack) {
      var details = makeDetails(obj, stack);
      reportErrorAndLog(details);
    },
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
            onPressed: () => {Future.error("xxxxxxxxxxxx")},
            child: Text('click'),
          ),
        ),
      ),
    );
  }
}

void collectLog(String line) {
  //收集日志
  print("收集日志");
}

void reportErrorAndLog(FlutterErrorDetails details) {
  //上报错误和日志逻辑
  print("上报错误和日志逻辑");
}

FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
  // 构建错误信息
  print("构建错误信息");
}
