import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: new MyHomePageWidget(),
    );
  }
}

class MyHomePageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new MyHomePage();
  }
}

class MyHomePage extends State<MyHomePageWidget> {

  //底部数据
  final Map bottomMap ={
    "首页":Icon(Icons.home),
    "朋友圈":Icon(Icons.camera),
    "信息":Icon(Icons.message),
    "其他":Icon(Icons.devices_other),
  };

  @override
  Widget build(BuildContext context) {
    int _index = 0;
    return new BottomNavigationBar(
        items: (){
          var items = <BottomNavigationBarItem>[];
          bottomMap.forEach((k,v){
            items.add(BottomNavigationBarItem(
              title:Text(k),//取map的值
              icon : v,//取map的图标
              backgroundColor:Colors.red,//背景红色
            ));
          });
          return items;
        }(),
        currentIndex: _index,//选中第几个
        onTap:(position){
          Fluttertoast.showToast(
            msg: 'text inputted: $position',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
          );
          setState(() {
            _index = position;//状态更新
          });
        }
    );
  }
}

