import 'package:flutter/material.dart';

///线性布局（Row/Column）
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "进度指示器",
      home: new Scaffold(
        appBar: AppBar(
          title: Text("进度指示器"),
        ),
        body: LinearWidget(),
      ),
    );
  }
}

class LinearWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      //测试Row对齐方式，排除Column默认居中对齐的干扰
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(" hello world "),
            Text(" I am Jack "),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(" hello world "),
            Text(" I am Jack "),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Text(" hello world "),
            Text(
              " I am Jack ",
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            Text(
              " hello world ",
              style: TextStyle(fontSize: 30.0),
            ),
            Text(" I am Jack "),
          ],
        ),
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: double.infinity),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("hi"),
              Text("world"),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text("left"),
            ),
            Expanded(
              flex: 2,
              child: Text("right", textAlign: TextAlign.right,),
            ),
          ],
        )
      ],
    );
  }
}
