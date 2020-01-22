import 'package:flutter/material.dart';

/// flutter路由管理：非路由命名
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '路由管理',
//      home: new FirstPager(),
      home: RouterTestRoute(),
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
        child: new RaisedButton(onPressed: () {return Navigator.pop(context);}),
      ),
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Router'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () async {
              var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TipRoute(text: "我是传入的数据")));
              //输出`TipRoute`路由返回结果
              print("路由返回值: $result");
            },
            child: Text('打开提示页'),
          ),
        ));
  }
}

class TipRoute extends StatelessWidget {
  final String text;

  TipRoute({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('提示'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Center(
          child: new Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                child: new Text('返回'),
                onPressed: () => Navigator.pop(context, '我是返回值'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
