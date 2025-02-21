import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 204, 191, 149)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'flutter calc'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Row> buttonList = [];
    for (int i = 9; i >= 0; i--) {
      if (i % 3 == 0) {
        buttonList.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ));
      }
      buttonList.last.children.insert(
          0,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(50, 50),
            ),
            onPressed: () {
              setState(() {
                _counter = _counter * 10 + i;
              });
            },
            child: Text(i.toString()),
          ));
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Number:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text('+1'),
                ),
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Text('-1'),
                ),
              ],
            ),
            Column(
              children: buttonList,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
