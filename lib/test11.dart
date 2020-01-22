import 'package:flutter/material.dart';

///在Widget树中获取父级State对象
void main() =>
    runApp(new MaterialApp(
      title: '',
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  MyState createState() {
    return MyState();
  }
}

//class MyState extends State {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: AppBar(
//        title: Text("子树中获取State对象"),
//      ),
//      body: Center(
//        child: Builder(builder: (context) {
//          return RaisedButton(
//            onPressed: () {
//              // 查找父级最近的Scaffold对应的ScaffoldState对象
//              ScaffoldState _state = context.ancestorStateOfType(
//                  TypeMatcher<ScaffoldState>());
//              //调用ScaffoldState的showSnackBar来弹出SnackBar
//              _state.showSnackBar(
//                SnackBar(
//                  content: Text("我是SnackBar"),
//                ),
//              );
//            },
//            child: Text("显示SnackBar"),
//          );
//        }),
//      ),
//    );
//  }
//}

//class MyState extends State {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: AppBar(
//        title: Text("子树中获取State对象"),
//      ),
//      body: new Center(
//        child: Builder(
//            builder: (context) => RaisedButton(
//                  onPressed: () {
//                    ScaffoldState ancestorStateOfType = context
//                        .ancestorStateOfType(TypeMatcher<ScaffoldState>());
//                    ancestorStateOfType.showSnackBar(SnackBar(
//                      content: Text("我是SnackBar"),
//                    ));
//                  },
//                  child: Text("显示SnackBar"),
//                )),
//      ),
//    );
//  }
//}

//class MyState extends State {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: AppBar(
//        title: Text("子树中获取State对象"),
//      ),
//      body: new Center(
//        child: Builder(
//            builder: (context) => RaisedButton(
//              onPressed: () {
//                ScaffoldState ancestorStateOfType = Scaffold.of(context);
//                ancestorStateOfType.showSnackBar(SnackBar(
//                  content: Text("我是SnackBar"),
//                ));
//              },
//              child: Text("显示SnackBar"),
//            )),
//      ),
//    );
//  }
//}

class MyState extends State {

  //定义一个globalKey, 由于GlobalKey要保持全局唯一性，我们使用静态变量存储
  static GlobalKey<ScaffoldState> _globalKey= GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text("子树中获取State对象"),
      ),
      body: new Center(
        child: Builder(
            builder: (context) => RaisedButton(
              onPressed: () {
                _globalKey.currentState.showSnackBar(SnackBar(
                  content: Text("我是SnackBar2"),
                ));
              },
              child: Text("显示SnackBar"),
            )),
      ),
    );
  }
}