import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Navigation',
      home: new FirstPager(),
    );
  }
}

class FirstPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('First Pager'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: Text('my is first pager'),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new SecondPager()));
          },
        ),
      ),
    );
  }
}

class SecondPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Second Pager'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('my is second pager'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
