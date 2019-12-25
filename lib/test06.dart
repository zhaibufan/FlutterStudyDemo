import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyWidget());

class MyWidget extends StatefulWidget {
  final int initValue;

  const MyWidget({Key key, this.initValue: 0});

  @override
  State<StatefulWidget> createState() => new MyState();
}

class MyState extends State<MyWidget> {
  int counter;

  @override
  void initState() {
    super.initState();
    counter = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: FlatButton(
          child: Text('$counter'),
          onPressed: () => setState(() => ++counter),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(MyWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
