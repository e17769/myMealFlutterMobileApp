import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//Helper classes
class meal {
  bool had = false;
  String name = '';
  int wait = 120 * 60; //two hours

  meal({this.name, this.had, this.wait});

  int get Wait => wait;
  set Wait(int minuteToWait) => wait = minuteToWait;

  String get Name => had ? name + '**Done**' : name;

  bool get Had => had;

  set Had(bool status) => had = status;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Day',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Good morning BOSS!'),
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
  int _counter = 0;
  Timer _timer;
  bool _timerStarted = false;

  final meal _coffee = meal(name: 'Coffee Time!', had: false, wait: 3 * 60);
  final meal _first = meal(name: 'First meal', had: false, wait: 120 * 60);
  final meal _second = meal(name: 'Second meal', had: false, wait: 120 * 60);
  final meal _third = meal(name: 'Third meal', had: false, wait: 120 * 60);
  final meal _fourth = meal(name: 'Fourth meal', had: false, wait: 120 * 60);
  final meal _final = meal(name: 'Final meal', had: false, wait: 120 * 60);

  //State

  void startMealCounter(meal m) {
    setState(() {
      _counter = m.Wait;
      startTimer();
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  void startTimer() {
    if (!_timerStarted) {
      _timerStarted = true;

      const Duration oneSec = Duration(seconds: 1);
      _timer = Timer.periodic(
          oneSec,
          (Timer timer) => setState(() {
                if (_counter < 1) {
                  timer.cancel();
                  _timerStarted = false;
                } else {
                  _counter = _counter - 1;
                }
              }));
    }
  }

  @override
  Widget build(BuildContext context) {
    final meal first = _first;
    final meal second = _second;
    final meal third = _third;
    final meal fourth = _fourth;
    final meal last = _final;
    final meal coffee = _coffee;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('time Remaining',
                style: Theme.of(context).textTheme.headline6),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton.icon(
                label: Text(coffee.Name),
                style: TextButton.styleFrom(
                  shadowColor: Colors.black38,
                  textStyle: const TextStyle(fontSize: 50),
                  primary: Colors.white,
                  backgroundColor: Colors.brown,
                ),
                icon: const Icon(Icons.timelapse),
                onPressed: () => startMealCounter(coffee)),
            //First on

            TextButton.icon(
                label: Text(first.name),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                icon: const Icon(Icons.timelapse),
                onPressed: () => startMealCounter(first)),
            //second meal
            TextButton.icon(
                label: Text(second.name),
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.lightBlueAccent),
                icon: const Icon(Icons.timelapse),
                onPressed: () => startMealCounter(second)),
            //3rd meal
            TextButton.icon(
                label: Text(third.name),
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.deepOrangeAccent),
                icon: const Icon(Icons.timelapse),
                onPressed: () => startMealCounter(third)),
            //4th meal
            TextButton.icon(
                label: Text(fourth.name),
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.orangeAccent),
                icon: const Icon(Icons.timelapse),
                onPressed: () => startMealCounter(fourth)),
            //5th meal
            TextButton.icon(
                label: Text(last.name),
                style: TextButton.styleFrom(
                    primary: Colors.white, backgroundColor: Colors.deepOrange),
                icon: const Icon(Icons.timelapse),
                onPressed: () => startMealCounter(last)),
            //Original
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _reset,
        tooltip: 'Reset',
        child: const Icon(Icons.restore),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
