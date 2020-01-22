import 'package:flutter/material.dart';

///单选复选框
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "单选复选框",
      home: new Scaffold(
        appBar: AppBar(
          title: Text("单选复选框"),
        ),
        body: SwitchAndCheckBoxTestRoute(),
      ),
    );
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  SwitchAndCheckBoxStatus createState() {
    return SwitchAndCheckBoxStatus();
  }
}

class SwitchAndCheckBoxStatus extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
            value: _switchSelected,
            onChanged: (value) => {setState(() => _switchSelected = value)}),
        Checkbox(
            value: _checkboxSelected,
            onChanged: (value) {
              setState(() {
                _checkboxSelected = value;
              });
            })
      ],
    );
  }
}
