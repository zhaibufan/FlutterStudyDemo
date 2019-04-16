import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp("haha"));

class MyApp extends StatelessWidget {
  final String text;

  MyApp(this.text) {}

  @override
  Widget build(BuildContext context) {
    var wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'flutter app',
      theme: new ThemeData(primaryColor: Colors.white),
      home: new RandomWords(),
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('welcome to flutter'),
//        ),
//        body: new Center(
//          child: new RandomWords(),
//        ),
//      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[]; //保存单词的容器
  final _biggerFont = new TextStyle(fontSize: 18); //字体大小
  final _saveSuggestions = new Set<WordPair>(); //用于保存收藏的单词

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text('Title - ListView'),
        ),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
      drawer: new Drawer(
        child: new ListView(),
      ),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(0.0),
      itemBuilder: (context, i) {
        print('i========$i');
        //奇数行返回分割线
        if (i.isOdd) return new Divider();
        //语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整）比如i为：1, 2, 3, 4, 5
        //时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
        final index = i ~/ 2;
        var length = _suggestions.length;
        if (index >= length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow((length > 0) ? _suggestions[index] : null);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final contains = _saveSuggestions.contains(pair);
//    if(pair == null) {
//      return null;
//    }
    return new ListTile(
      title: new Text(
        pair == null ? 'default' : pair.asLowerCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        contains ? Icons.favorite : Icons.favorite_border,
        color: contains ? Colors.red : null,
        size: 20,
      ),
      onTap: () {
        setState(() {
          if (contains) {
            _saveSuggestions.remove(pair);
          } else {
            _saveSuggestions.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final title = _saveSuggestions.map((pair) {
        return new ListTile(
            title: new Text(
          pair.asLowerCase,
          style: _biggerFont,
        ));
      });
      var divideTiles =
          ListTile.divideTiles(context: context, tiles: title).toList();
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Saved Suggestions'),
        ),
        body: new ListView(
          children: divideTiles,
        ),
      );
    }));
  }
}
