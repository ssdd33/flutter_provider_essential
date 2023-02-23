import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class Counter with ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Counter _counter = Counter();

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'anonymous Router',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) =>
            ChangeNotifierProvider.value(value: _counter, child: MyHomePage()),
        '/counter': (context) => ChangeNotifierProvider.value(
            value: _counter, child: ShowMeCounter()),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/counter');
              },
              child: Text('show me counter'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<Counter>().increment();
              },
              child: Text('increment counter'),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowMeCounter extends StatelessWidget {
  const ShowMeCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('counter'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('${context.read<Counter>().count}'),
        ));
  }
}
