import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

///flutter路由管理：路由生成钩子
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '路由生成钩子',
      initialRoute: '/',
      onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => GenericWidget(
                settings: settings,
              )),
//      home: RouteWidget(),
      routes: {
        '/': (context) => RouteWidget(),
      },
    );
  }
}

class RouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('RouteWidget'),
      ),
      body: new Center(
        child: RaisedButton(
          child: Text('launch'),
          onPressed: () => Navigator.pushNamed(context, '/ff'),
        ),
      ),
    );
  }
}

class GenericWidget extends StatelessWidget {
  final RouteSettings settings;
  GenericWidget({prefix0.Key key, @required this.settings}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String routeName = settings.name;
    print("routeName = $routeName");
    return new Scaffold(
      appBar: AppBar(
        title: Text('通用页面'),
      ),
      body: Center(),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
