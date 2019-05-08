import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'test01', home: new HomePager());
  }
}

class HomePager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('test01 title'),
      ),
      body: new Center(
        child: CustomText('my is custom text'),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  Paint pb = new Paint();
  String text;

  //构造函数 参数外部传进来
  CustomText(this.text);

  @override
  Widget build(BuildContext context) {
    pb.color = Colors.red;
    //text=null时显示默认内容hello
    return new Text(text ?? 'hello', style: TextStyle(
        color: Colors.blue,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        background: pb
    ),);
  }
}
