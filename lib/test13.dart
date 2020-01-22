import 'package:flutter/material.dart';

///Button的使用
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void onClick() {
    print("click");
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Button",
      home: new Scaffold(
          appBar: AppBar(
            title: Text('test Button'),
          ),
          body: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text('RaisedButton'),
                  onPressed: () => onClick,
                ),
                FlatButton(
                  child: Text("FlatButton"),
                  onPressed: () {
                    onClick();
                  },
                ),
                OutlineButton(
                  child: Text("OutlineButton"),
                  onPressed: () => onClick,
                ),
                IconButton(
                  icon: Icon(Icons.thumb_up),
//                  onPressed: () => onClick,
                ),
                FlatButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("Submit"),
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {},
                )
              ],
            ),
          )),
    );
  }
}
