import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'test01', home: new HomePager());
  }
}

class HomePager extends StatelessWidget {
  final editController = TextEditingController();

  //图片路径
  String image_url =
      "https://ws1.sinaimg.cn/large/0065oQSqgy1fze94uew3jj30qo10cdka.jpg";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('test01 title'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.add_a_photo),
              onPressed: () {
                print('text inputted: ${editController.text}');
                //Toast
                Fluttertoast.showToast(
                  msg: 'text inputted: ${editController.text}',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                );
              })
        ],
      ),
      body: new Center(
//        child: CustomText('my is custom text'),
//        child: RichWidget(),
//        child: TextFieldWidget(editController),
//        child: ImageWidget(image_url),
//        child: ContainPaddingWidget(),
//        child: StackWidget(image_url),
//        child: ColumnWidget(),
//          child: RowWidget(),
          child: RowWidget2(),

      ),
    );
  }
}

// 自定义Text widget
class CustomText extends StatelessWidget {
  Paint pb = new Paint();
  String text;

  //构造函数 参数外部传进来
  CustomText(this.text);

  @override
  Widget build(BuildContext context) {
    pb.color = Colors.red;
    //text=null时显示默认内容hello
    return new Text(
      text ?? 'hello',
      style: TextStyle(
          color: Colors.blue,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          background: pb),
    );
  }
}

//自定义富文本RichText widget
class RichWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RichText(
        text: TextSpan(
            text: 'This is RichText',
            style:
                new TextStyle(inherit: true, fontSize: 16, color: Colors.black),
            children: <TextSpan>[
          new TextSpan(
            text: 'Android艺术探索',
            style: new TextStyle(
              color: Colors.redAccent,
              //字体粗细
              fontWeight: FontWeight.bold,
            ),
          ),
          new TextSpan(text: '中规中矩'),
          new TextSpan(
              text: 'the last text',
              style: new TextStyle(fontSize: 19, color: Colors.blue))
        ]));
  }
}

//文本输入框
class TextFieldWidget extends StatelessWidget {
  final controller;

  TextFieldWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      //最大长度,右下角会显示一个输入数量的字符串
      maxLength: 26,
      //最大行数
      maxLines: 1,
      //是否自动更正
      autocorrect: true,
      //是否自动对焦
      autofocus: true,
      //设置密码 true：是密码 false：不是秘密
      obscureText: true,
      //文本对齐样式
      textAlign: TextAlign.center,
    );
  }
}

class ImageWidget extends StatelessWidget {
  String image_url;

  ImageWidget(this.image_url);

  @override
  Widget build(BuildContext context) {
//    return Image.network(image_url);
    return new CachedNetworkImage(
      imageUrl: image_url,
      //占位符
      placeholder: new CircularProgressIndicator(),
      //加载错误时显示的图片
      errorWidget: new Icon(Icons.error),
      //宽高
      width: 200,
      height: 200,
    );
  }
}

class ContainPaddingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 200,
      height: 200,
      child: new Center(
        child: new Padding(
          padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
          child: Text('My name is zxf'),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.redAccent, borderRadius: BorderRadius.circular(10)),
    );
  }
}

// 层叠效果
class StackWidget extends StatelessWidget {
  String imageUrl;

  StackWidget(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return new Stack(children: <Widget>[
      new Image.network(
        imageUrl,
        width: 300,
        height: 300,
      ),
      new Opacity(
        opacity: 1,
        child: new Container(
          width: 200,
          height: 200,
          color: Colors.redAccent,
        ),
      ),
      new Opacity(
        opacity: 0.5,
        child: new Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
      )
    ], alignment: new Alignment(0, 0));
  }
}

//Column布局
class ColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color:Colors.blue,
          width: 50,
          height: 50,
        ),
        Container(
          color:Colors.black,
          width:50,
          height:50,
        ),
        Container(
          color:Colors.green,
          width:50,
          height:50,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,);
  }
}

class RowWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Row(
      children: <Widget>[
        new RaisedButton(
            onPressed: (){

            },
            color:Colors.green,
            child:new Text('绿色按钮1')
        ),

        new RaisedButton(
            onPressed:(){

            },
            color:Colors.red,
            child:new Text('黑色按钮3')),
        new Expanded(
          child:new RaisedButton(
              onPressed: (){

              },
              color:Colors.yellow,
              child:new Text('黄色按钮2')
          ),),
      ],
    );
  }
}

class RowWidget2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Row(
      children: <Widget>[
        Expanded(
          child:Container(
            color:Colors.green,
            padding:EdgeInsets.all(8),
            height: 40.0,
          ),
          flex:1,
        ),
        Expanded(
          child:Container(
            color:Colors.yellow,
            padding:EdgeInsets.all(8),
            height: 40.0,
          ),
          flex:2,
        ),
        Expanded(
          child:Container(
            color:Colors.red,
            padding:EdgeInsets.all(8),
            height: 40.0,
          ),
          flex: 3,),
      ],
    );
  }
}

