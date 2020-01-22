import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: "test",
      home: new AppHome(),
    ),
  );
  
  FlutterError.onError = (FlutterErrorDetails detail) {
    reportError(detail);
  };
}

void reportError(FlutterErrorDetails detail) {
  print("detail = ${detail.exception.toString()}");
}

class AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Center(
        child: new FlatButton(
          onPressed: () => {debugDumpApp()},
          child: new Text('Dump App'),
        ),
      ),
    );
  }
}
