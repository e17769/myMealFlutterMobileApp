import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';

void main() {
  runApp(MyApp());
}

//Helper classes
class meal {
  bool haveHadIt = false;
  String name = '';
  int wait = 120 * 60; //two hours
  IconData icon = Icons.timelapse;
  Color color = Colors.white30;
  double myFontSize = 18;

  meal({this.name, this.haveHadIt, this.wait, this.color, this.myFontSize});

  String get Name => haveHadIt ? '*' + name + '*' : name;

  IconData get ICON => haveHadIt ? Icons.done : icon;

  Color get MyColor => haveHadIt ? Colors.black12 : color;
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

  final meal _coffee = meal(
      name: 'Coffee Time!', haveHadIt: false, wait: 2, color: Colors.brown);
  final meal _first = meal(
      name: 'First meal',
      haveHadIt: false,
      wait: 2,
      color: Colors.blue); //120 * 60
  final meal _second = meal(
      name: 'Second meal',
      haveHadIt: false,
      wait: 2,
      color: Colors.lightBlueAccent); // 120 * 60
  final meal _third = meal(
      name: 'Third meal',
      haveHadIt: false,
      wait: 2,
      color: Colors.deepOrangeAccent); //120 * 60
  final meal _fourth = meal(
      name: 'Fourth meal',
      haveHadIt: false,
      wait: 2,
      color: Colors.orangeAccent); //120 * 60
  final meal _final = meal(
      name: 'Final meal',
      haveHadIt: false,
      wait: 2,
      color: Colors.deepOrange); //120 * 60

  //State

  void startMealCounter(meal m) {
    setState(() async {
      _counter = m.wait;
      m.haveHadIt = false;
      m.myFontSize = 60;
      startTimer(m);
    });
  }

  void _reset() {
    setState(() {
      _coffee.haveHadIt = false;
      _first.haveHadIt = false;
      _second.haveHadIt = false;
      _third.haveHadIt = false;
      _fourth.haveHadIt = false;
      _final.haveHadIt = false;
      _counter = 0;
    });
  }

  void startTimer(meal m) {
    if (!_timerStarted) {
      _timerStarted = true;

      const Duration oneSec = Duration(seconds: 1);
      _timer = Timer.periodic(
          oneSec,
          (Timer timer) => setState(() {
                if (_counter < 1) {
                  timer.cancel();
                  _timerStarted = false;
                  m.haveHadIt = true;
                  m.myFontSize = 18;
                  _showMyDialog(m);
                } else {
                  _counter = _counter - 1;
                }
              }));
    }
  }

  Future<void> _showMyDialog(meal m) async => showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            contentTextStyle: const TextStyle(color: Colors.white),
            backgroundColor: Colors.redAccent,
            title: Text('Hey dude! ' + m.name),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                      'Are you ready for your next treat? you have been waitting for ' +
                          (m.wait / 60).toString() +
                          ' minutes my guy! '),
                  const Text(
                      'Hey don not forget to start the timer for your next meal'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                    textStyle:
                        const TextStyle(fontSize: 20, color: Colors.white)),
                child: Text('Yes! It is time for ' + m.name + ' aint it'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

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
                  textStyle: TextStyle(fontSize: coffee.myFontSize),
                  primary: Colors.white,
                  backgroundColor: coffee.MyColor,
                ),
                icon: Icon(coffee.ICON),
                onPressed: () => startMealCounter(coffee)),
            //First on

            TextButton.icon(
                label: Text(first.Name),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: first.myFontSize),
                  primary: Colors.white,
                  backgroundColor: first.MyColor,
                ),
                icon: Icon(first.ICON),
                onPressed: () => startMealCounter(first)),
            //second meal
            TextButton.icon(
                label: Text(second.Name),
                style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: second.myFontSize),
                    primary: Colors.white,
                    backgroundColor: second.MyColor),
                icon: Icon(second.ICON),
                onPressed: () => startMealCounter(second)),
            //3rd meal
            TextButton.icon(
                label: Text(third.Name),
                style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: third.myFontSize),
                    primary: Colors.white,
                    backgroundColor: third.MyColor),
                icon: Icon(third.ICON),
                onPressed: () => startMealCounter(third)),
            //4th meal
            TextButton.icon(
                label: Text(fourth.Name),
                style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: fourth.myFontSize),
                    primary: Colors.white,
                    backgroundColor: fourth.MyColor),
                icon: Icon(fourth.ICON),
                onPressed: () => startMealCounter(fourth)),
            //5th meal
            TextButton.icon(
                label: Text(last.Name),
                style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: last.myFontSize),
                    primary: Colors.white,
                    backgroundColor: last.MyColor),
                icon: Icon(last.ICON),
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
