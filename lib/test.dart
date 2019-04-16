import 'package:flutter/material.dart';
//使用`flutter/material.dart` 目的是使用Matrial风格的小控件
import 'dart:async';//记得导库
void main(){
  //运行程序
  runApp(StateWidget());
}

class StateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _StateWidget("hello");
  }
}

//控件继承State
class _StateWidget extends State<StateWidget>{
  int Number = 0;
  String text;
  //构造函数
  _StateWidget(this.text);

  @override
  void initState(){
    //初始化，这个函数在控件的生命周期内调用一次
    super.initState();
    print("进入initState");
    //3秒后改变text的内容
    new Future.delayed(const Duration(seconds: 3),(){
      setState(() {
        Number++;
        text = "已经改变数值，数值现在是$Number";
      });
    });
  }

  @override
  void dispose(){
    //销毁
    super.dispose();
    print('销毁');
  }

  @override
  void didChangeDependencies(){
    //在initState之后调
    super.didChangeDependencies();
    print('进入didChange');
  }

  //重写build方法
  @override
  Widget build(BuildContext context) {
    return Container(
      //红色背景
      color: Colors.red,
      //内容居中
      alignment: Alignment.center,
      //Text控件
      child: new Text(
        //Dart语法中 ?? 表示如果text为空，就会返回??号的内容
        text ?? "没改变数值",
        textDirection: TextDirection.ltr,//需要加上这句不然报 RichText widgets require a Directionality widget ancestor.
      ),
    );
  }
}

