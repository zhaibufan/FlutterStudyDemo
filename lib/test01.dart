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
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.add_a_photo),
            tooltip: 'Add Photo',
            onPressed: () {},
          ),
          new PopupMenuButton<String>(itemBuilder: (BuildContext context) {
            return <PopupMenuItem<String>>[
              new PopupMenuItem(child: Text('this one'), value: "one",),
              new PopupMenuItem(child: Text('this two'), value: 'two',),
            ];
          }, onSelected: (String action) {
            switch (action) {
              case "one":
              //增加点击逻辑
                break;
              case "two":
              //增加点击逻辑
                break;
            }
          },),
        ],
      ),
      body: new Center(
        child: new Text('hello word'),
      ),
      drawer: new Drawer(
        child: new ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            ListTile(
              title: Text('This is Item_one'),
              leading: new CircleAvatar(
                child: new Icon(Icons.scanner),
              ),
            ),
            ListTile(
              title: Text('This is Item_two'),
              leading: new CircleAvatar(
                child: new Icon(Icons.list),
              ),
            ),
            ListTile(
              title: Text('This is Item_three'),
              leading: new CircleAvatar(
                child: new Icon(Icons.score),
              ),
            )
          ],
        ),
      ),
    );
  }
}
