import 'package:flutter/material.dart';

/// flutter路由管理
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '路由管理',
      home: new FirstPager(),
    );
  }
}

class FirstPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text('FirstPager')),
      body: new Center(
        child: new RaisedButton(
            onPressed: () => Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new SecondPager()))),
      ),
    );
  }
}

class SecondPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SecondPager'),
      ),
      body: new Center(
        child: new RaisedButton(onPressed: () => Navigator.pop(context)),
      ),
    );
  }
}
