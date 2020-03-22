import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge Dés',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Extreme Fury Rolling Dice 2000'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Random random = new Random();
  int _indexDice1 = 1;
  int _indexDice2 = 1;

  int _randomDice() {
    setState(() {
      _indexDice1 = random.nextInt(6) + 1;
      _indexDice2 = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                child: GestureDetector(
              onTap: _randomDice,
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Image.asset('images/dice' + '$_indexDice1' + '.png'),
              )
            )),
            Expanded(
                child: GestureDetector(
              onTap: _randomDice,
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Image.asset('images/dice' + '$_indexDice2' + '.png')
              ),
            )),
          ],
        ),
      ),
    );
  }
}
