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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.brown,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Good morning BOSS!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _timerStarted = false;

  final meal _coffee = meal(name: 'Coffee Time!', had: false, wait: 3 * 60);
  final meal _first = meal(name: 'First meal', had: false);
  final meal _second = meal(name: 'Second meal', had: false);
  final meal _third = meal(name: 'Third meal', had: false);
  final meal _fourth = meal(name: 'Fourth meal', had: false);
  final meal _final = meal(name: 'Final meal', had: false);

  //State

  void startMealCounter(meal m) {
    setState(() {
      _counter = m.Wait;
      startTimer();
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _reset() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter = 0;
    });
  }

  void startTimer() {
    if (!_timerStarted) {
      _timerStarted = true;

      const oneSec = const Duration(seconds: 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final meal first = _first;
    final meal second = _second;
    final meal third = _third;
    final meal fourth = _fourth;
    final meal last = _final;
    final meal coffee = _coffee;

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
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
