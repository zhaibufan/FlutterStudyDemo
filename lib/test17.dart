import 'package:flutter/material.dart';

///进度指示器
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
        body: ProgressBar(),
      ),
    );
  }
}

class ProgressBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProgressBarStatus();
  }
}

class ProgressBarStatus extends State with SingleTickerProviderStateMixin {
  double _value = 0;
  AnimationController _animationController;

  void update() {
    setState(() {
      _value += 0.1;
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {
        print(_animationController.value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
      LinearProgressIndicator(
        value: null,
        backgroundColor: Colors.grey,
        valueColor: AlwaysStoppedAnimation(Colors.blue),
      ),
      LinearProgressIndicator(
        value: 0.5,
        backgroundColor: Colors.grey,
        valueColor: AlwaysStoppedAnimation(Colors.blue),
      ),
      CircularProgressIndicator(
        backgroundColor: Colors.grey[200],
        valueColor: AlwaysStoppedAnimation(Colors.blue),
      ),
      //进度条显示50%，会显示一个半圆
      CircularProgressIndicator(
        backgroundColor: Colors.grey[200],
        valueColor: AlwaysStoppedAnimation(Colors.blue),
        value: .5,
      ),
      SizedBox(
        width: 100,
        height: 5,
        child: LinearProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
          value: .5,
        ),
      ),
      SizedBox(
        height: 100,
        width: 100,
        child: CircularProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
          value: .7,
        ),
      ),
      CircularProgressIndicator(
        backgroundColor: Colors.grey[200],
        valueColor: AlwaysStoppedAnimation(Colors.blue),
        value: _value,
      ),
      RaisedButton(
        onPressed: update,
      ),
      LinearProgressIndicator(
        backgroundColor: Colors.grey[200],
        valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
            .animate(_animationController),
        // 从灰色变成蓝色
        value: _animationController.value,
      ),
      CircularProgressIndicator(
        backgroundColor: Colors.grey[200],
        valueColor: ColorTween().animate(_animationController),
        value: _animationController.value,
      )
    ]
            .map((e) => Padding(
                  padding: EdgeInsets.all(15),
                  child: e,
                ))
            .toList());
  }
}
