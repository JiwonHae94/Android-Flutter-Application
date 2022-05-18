import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const AndroidFlutterApplication());
}

class AndroidFlutterApplication extends StatelessWidget{
    const AndroidFlutterApplication({ Key ? key}) : super(key : key);

    @override
    Widget build(BuildContext context) {
      final wordPair = WordPair.random();

      return MaterialApp(
          title: "Welcome to FlutterApplication",
          home : Scaffold(
            appBar: AppBar(title: const Text("Title")),
            body: Center(
              child:RandomWords(),
            ),
          ),
        );
    }
}

class RandomWords extends StatefulWidget{
  const RandomWords({ Key? key}) : super(key : key);

  @override
  RandomWordState createState() {
    return RandomWordState();
  }
}

class RandomWordState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFront = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return ListTile(
            title: Text(
              _suggestions[index].asPascalCase,
              style: _biggerFront
            ),
          );
        }
    );
  }
}