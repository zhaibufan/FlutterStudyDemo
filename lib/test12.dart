import 'package:flutter/material.dart';

///Text控件的文本和样式
void main() => runApp(MyApp3());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test12',
      home: new Scaffold(
        appBar: AppBar(
          title: Text("text文本样式"),
        ),
        body: Text(
          "textAlign  " * 20,
          textAlign: TextAlign.right,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              height: 1.2,
              background: new Paint()..color = Colors.yellow,
              decoration: TextDecoration.underline,
              decorationColor: Colors.black,
              decorationStyle: TextDecorationStyle.dotted),
        ),
      ),
    );
  }
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test12',
      home: new Scaffold(
        appBar: AppBar(
          title: Text("text文本样式"),
        ),
        body: Text.rich(TextSpan(children: [
          TextSpan(text: "home:"),
          TextSpan(
              text: "https://flutterchina.club",
              style: TextStyle(color: Colors.red))
        ])),
      ),
    );
  }
}

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test12',
      home: new Scaffold(
        appBar: AppBar(
          title: Text("text文本样式"),
        ),
        body: TextWidget()
      ),
    );
  }
}

class TextWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: TextStyle(
          color: Colors.red,
          fontSize: 20.0,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("text1111111"),
              Text("text22222222"),
              Text(
                "text333333",
                style: TextStyle(color: Colors.yellow),
              )
            ],
          ),
        ));
  }
}
